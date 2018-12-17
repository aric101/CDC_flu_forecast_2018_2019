##########################################################
############# Data Loading  ##############################
##########################################################
rm(list=ls())
week2season <- function(k)c((40:52),(1:39))[k]
week2season(5)

system("ls ./data/*.csv")

### national data
flu.data <- read.csv("./data/ILINet.csv", header=F)[-(1:2),]
names(flu.data) <- as.character(read.csv("./data/ILINet.csv", header=F, colClasses="character")[2,])
names(flu.data)[5] <- "ILI"
head(flu.data)
flu.data <- flu.data[-which(flu.data$ILI=="X"),]

flu.data$ILI <- as.numeric(as.character(flu.data$ILI))
flu.data$YEAR <- as.numeric(as.character(flu.data$YEAR))
flu.data$WEEK <- as.numeric(as.character(flu.data$WEEK))
flu.data$ILI <- signif(flu.data$ILI,2)

#flu.data <- flu.data[(flu.data$YEAR==2016 & flu.data$WEEK>=40),c(2:5)]
flu.data <- flu.data[((flu.data$YEAR==2016 & flu.data$WEEK>=40) | flu.data$YEAR==2018),c(2:5)]

#wkID <- (5:8) + (tail(flu.data$WEEK,1)-43)
if(tail(flu.data$WEEK,1)>44){
    wkID <- (5:8) + (tail(flu.data$WEEK,1)-44)
}else{
    wkID <- (5:8) + (tail(flu.data$WEEK,1)+9)
}

### regional data
flu.data.HHS <- read.csv("./data/ILINetHHS.csv", header=F)[-(1:2),]
names(flu.data.HHS) <- as.character(read.csv("./data/ILINetHHS.csv", header=F, colClasses="character")[2,])
names(flu.data.HHS)[5] <- "ILI"
head(flu.data.HHS)
flu.data.HHS <- flu.data.HHS[-which(flu.data.HHS$ILI=="X"),]


flu.data.HHS$ILI <- as.numeric(as.character(flu.data.HHS$ILI))
flu.data.HHS$YEAR <- as.numeric(as.character(flu.data.HHS$YEAR))
flu.data.HHS$WEEK <- as.numeric(as.character(flu.data.HHS$WEEK))
flu.data.HHS$ILI <- signif(flu.data.HHS$ILI,2)

#flu.data.HHS <- flu.data.HHS[(flu.data.HHS$YEAR==2016 & flu.data.HHS$WEEK>=40),c(2:5)]
flu.data.HHS <- flu.data.HHS[((flu.data.HHS$YEAR==2016 & flu.data.HHS$WEEK>=40) | flu.data.HHS$YEAR==2018),c(2:5)]

### forecasts data by all models
model.data <- read.csv("./tmp17.csv",header=F)
model.names <- levels(model.data$V1)
region.names <- levels(model.data$V2)
wk.ahead <- levels(model.data$V3)

flu.data$REGION <- tail(region.names,1)
flu.data.HHS$REGION <- paste("HHS ", flu.data.HHS$REGION, sep="")
flu.data.all <- rbind(flu.data, flu.data.HHS)

sim.data <- 
lapply(1:length(region.names),function(i){
  tmp1 <- model.data[model.data$V2==region.names[i],]
  lapply(1:length(model.names),function(k){
    tmp2 <- tmp1[tmp1$V1==model.names[k],]
    c(tail(flu.data.all$ILI[flu.data.all$REGION == region.names[i]],1)[1], tmp2$V8)
  })
})


region.names

png("flu_comparison0.png", width=8, height=8, units="in",res=300)
par(mfrow=c(4,3),mar=c(4, 4, 2, 0.2), oma=c(0,0,0,0))

plot.new()
legend("topleft",
       c("CDC flu data",
         "Other Teams",
         "UCSF1",
         "UCSF2"),
       col=c("black","gray","blue","red"),
       lty=c(1,1,1,1),
       lwd=c(3,1,1,1),
       cex=1.5
)

sapply(1:length(region.names),function(i){
ILI.true <- flu.data.all$ILI[flu.data.all$REGION == region.names[i]]
plot(1:length(week2season(1:(head(wkID,1)-1))), ILI.true[1:length(week2season(1:(head(wkID,1)-1)))], xlim=c(1, 4+length(week2season(1:(head(wkID,1)-2)))), ylim=c(0.3, 8),type="l",lwd=3, ylab="ILI%", xlab="Week", main=region.names[i], xaxt="n")
axis(side=1, at=c(1: (length(week2season(1:(head(wkID,1)-2)))+4)), labels=week2season(c(1: (length(week2season(1:(head(wkID,1)-2)))+4))))
sapply(1:length(model.names),function(k)
if(length(sim.data[[i]][[k]]) == 5)lines(tail(c(1: (length(week2season(1:(head(wkID,1)-1)))+4)), 5), sim.data[[i]][[k]], col="gray")
)
lines(tail(c(1: (length(week2season(1:(head(wkID,1)-1)))+4)), 5), sim.data[[i]][[1]], col="blue")
lines(tail(c(1: (length(week2season(1:(head(wkID,1)-1)))+4)), 5), sim.data[[i]][[2]], col="red")
#lines(tail(1:length(week2season(1:(head(wkID,1)-1))), 2), tail(ILI.true,2), lty=2, lwd=2)
})


dev.off()


model.data.2 <- read.csv("./tmp17.2.csv",header=F)
model.names.2 <- levels(model.data.2$V1)
model.names.2
region.names.2 <- levels(model.data.2$V2)
region.names.2
wk.ahead.2 <- levels(model.data$V3)
wk.ahead.2 <- wk.ahead.2[1]
wk.ahead.2

sim.data.2 <- 
lapply(1:length(region.names.2),function(i){
  tmp1 <- model.data.2[model.data.2$V2==region.names.2[i],]
  lapply(1:length(model.names.2),function(k){
    tmp2 <- tmp1[tmp1$V3==wk.ahead.2 & tmp1$V1==model.names.2[k],]
    tmp2$V8
  })
})

## data.smooth <- 
## sapply(1:length(region.names.2), function(k){
## tmp <- smooth(sim.data.2[[k]][[20]], "3RS3R")
## tmp/sum(tmp)
## })

data.smooth <- 
sapply(1:length(region.names.2), function(k){
tmp.mean <- sum(c(0:130)/10*sim.data.2[[k]][[1]])
tmp.sd <- sd(sample(x=(0:130)/10, 10000, replace=T, prob=sim.data.2[[k]][[1]]))/1
tmp <- dnorm(x=(0:130)/10, mean=tmp.mean, sd=tmp.sd)
tmp/sum(tmp)
})

for(k in 1:length(region.names.2)){
  #sim.data.2[[k]][[1]] <- data.smooth[,k]
}


region.names.2

png("flu_comparison00.png", width=8, height=8, units="in",res=300)
par(mfrow=c(4,3),mar=c(4, 4, 2, 0.2), oma=c(0,0,0,0))

plot.new()
legend("topleft",
       c(
         "UCSF1",
         "UCSF2"),
       col=c("blue","red"),
       lty=c(1,1),
       lwd=c(1,1),
       cex=1.5
)

sapply(1:length(region.names.2),function(i){
  plot((0:130)/10, sim.data.2[[i]][[1]], type="l", xlim=c(0,10),ylim=c(0,0.5), ylab="prob of ILI%", xlab="wk18|wk17",main=region.names[i], col="blue")
  lines((0:130)/10, sim.data.2[[i]][[2]], col="red")
  lines((0:130)/10, sim.data.2[[i]][[1]], col="blue")
  lines((0:130)/10, sim.data.2[[i]][[2]], col="red")
  lines((0:130)/10, sim.data.2[[i]][[4]], col="red")
})

dev.off()

system("convert flu_comparison00.png flu_comparison0.png -append flu_comparison000.png")


