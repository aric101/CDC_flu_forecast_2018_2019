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

flu.data <- flu.data[((flu.data$YEAR==2016 & flu.data$WEEK>=40) | flu.data$YEAR==2018),c(2:5)]

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

flu.data.HHS <- flu.data.HHS[((flu.data.HHS$YEAR==2016 & flu.data.HHS$WEEK>=40) | flu.data.HHS$YEAR==2018),c(2:5)]

### forecasts data by all models
model.data <- read.csv("./tmp16.csv",header=F)
model.names <- levels(model.data$V1)
M.name <- gsub("-2016-12-*.csv", "", model.names)
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
    c(tail(flu.data.all$ILI[flu.data.all$REGION == region.names[i]],2)[1], tmp2$V8)
  })
})


region.names
model.names
UCSF1 <- grep("TeamC",model.names)
UCSF2 <- grep("TeamD",model.names)
UCSF1
UCSF2

png("flu_comparison.png", width=8, height=8, units="in",res=300)
par(mfrow=c(4,3),mar=c(4, 4, 2, 0.2), oma=c(0,0,0,0))

plot.new()
legend("topleft",
       c("CDC flu data",
         "obs ILI at wk17",
         "Other Teams",
         "UCSF1",
         "UCSF2"),
       col=c("black","black","gray","blue","red"),
       lty=c(1,2,1,1,1),
       lwd=c(3,2,1,1,1),
       cex=1.5
)

sapply(1:length(region.names),function(i){
ILI.true <- flu.data.all$ILI[flu.data.all$REGION == region.names[i]]
plot(1:length(week2season(1:(head(wkID,1)-2))), ILI.true[1:length(week2season(1:(head(wkID,1)-2)))], xlim=c(1, 4+length(week2season(1:(head(wkID,1)-2)))), ylim=c(0.3, 8),type="l",lwd=3, ylab="ILI%", xlab="Week", main=region.names[i], xaxt="n")
axis(side=1, at=c(1: (length(week2season(1:(head(wkID,1)-2)))+4)), labels=week2season(c(1: (length(week2season(1:(head(wkID,1)-2)))+4))))
sapply(1:length(model.names),function(k)
if(length(sim.data[[i]][[k]]) == 5)lines(tail(c(1: (length(week2season(1:(head(wkID,1)-2)))+4)), 5), sim.data[[i]][[k]], col="gray")
)
lines(tail(c(1: (length(week2season(1:(head(wkID,1)-2)))+4)), 5), sim.data[[i]][[UCSF1]], col="blue")
lines(tail(c(1: (length(week2season(1:(head(wkID,1)-2)))+4)), 5), sim.data[[i]][[UCSF2]], col="red")
lines(tail(1:length(week2season(1:(head(wkID,1)-1))), 2), tail(ILI.true,2), lty=2, lwd=2)
})

dev.off()




### forecasts distributions by all models
model.data.2 <- read.csv("./tmp16.2.csv",header=F)
model.names.2 <- levels(model.data.2$V1)
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
tmp.mean <- sum(c(0:130)/10*sim.data.2[[k]][[UCSF1]])
tmp.sd <- sd(sample(x=(0:130)/10, 10000, replace=T, prob=sim.data.2[[k]][[UCSF1]]))/2
tmp <- dnorm(x=(0:130)/10, mean=tmp.mean, sd=tmp.sd)
tmp/sum(tmp)
})

for(k in 1:length(region.names.2)){
  #sim.data.2[[k]][[UCSF1]] <- data.smooth[,k]
}

region.names.2

par(mfrow=c(4,3),mar=c(4, 4, 2, 0.2), oma=c(0,0,0,0))
plot.new()
legend("topleft",
       c(
         "obs ILI at wk17",
         "Other Teams",
         "UCSF1",
         "UCSF2"),
       col=c("black","gray","blue","red"),
       lty=c(2,1,1,1),
       lwd=c(2,1,1,1),
       cex=1.5
)

lik.all <- 
sapply(1:length(region.names.2),function(i){
ILI.true <- tail(flu.data.all$ILI[flu.data.all$REGION == region.names.2[i]],1)
plot((0:130)/10, sim.data.2[[i]][[UCSF1]], type="l", ylim=c(0,0.5), ylab="prob of ILI%", xlab="wk17|wk16",main=region.names[i], col="blue")
lines((0:130)/10, sim.data.2[[i]][[UCSF2]], col="red")
lik.tmp <- 
sapply(1:length(model.names),function(k)
if(length(sim.data.2[[i]][[k]]) == 131){lines((0:130)/10, sim.data.2[[i]][[k]], col="gray")
                                        return(sim.data.2[[i]][[k]][floor(ILI.true*10)+1])
                                      }else{
                                        tmp <- c(sim.data.2[[i]][[k]],rep(0,131-length(sim.data.2[[i]][[k]])))
                                        lines((0:130)/10, tmp, col="gray")
                                        return(tmp[floor(ILI.true*10)+1])
                                      }
)
lines((0:130)/10, sim.data.2[[i]][[UCSF1]], col="blue")
lines((0:130)/10, sim.data.2[[i]][[UCSF2]], col="red")
abline(v=ILI.true, lty=2)
legend("topright",
       c(
         paste("UCSF1 rank:", which(order(-lik.tmp)==UCSF1)),
         paste("UCSF2 rank:", which(order(-lik.tmp)==UCSF2))
         )       
)
lik.tmp
})

rank.all <- apply(lik.all,2, function(x)order(-x))
rank.final <- sapply(1:ncol(rank.all),function(i)sapply(1:length(model.names.2),function(k)which(rank.all[,i]==k)))
rank.avg <- order(apply(rank.final,1,mean))
which(rank.avg==UCSF1)
which(rank.avg==UCSF2)
model.names[rank.avg[1]]

## save plot
png("flu_comparison.2.png", width=12, height=8, units="in",res=300)
par(mfrow=c(4,3),mar=c(0.2, 0.2, 0.2, 0.2), oma=c(3,3,0,0))

plot.new()
legend("topleft",
       c(
         "obs ILI at wk17",
         "Other Teams",
         paste("UCSF1 rank:", which(rank.avg==UCSF1)),
         paste("UCSF2 rank:", which(rank.avg==UCSF2)),
         paste("best model:", M.name[rank.avg[1]])
         ),
       col=c("black","gray","blue","red", "green"),
       lty=c(2,1,1,1,1),
       lwd=c(2,1,1,1,1),
       cex=1.5
)

lik.all <- 
sapply(1:length(region.names.2),function(i){
ILI.true <- tail(flu.data.all$ILI[flu.data.all$REGION == region.names.2[i]],1)
if(i<9)plot((0:130)/10, sim.data.2[[i]][[UCSF1]], type="l", xlim=c(0,10),ylim=c(0,0.25), ylab="prob of ILI%", xlab="wk17|wk16", col="blue", yaxt="n", xaxt="n")
if(i>=9)plot((0:130)/10, sim.data.2[[i]][[UCSF1]], type="l", xlim=c(0,10),ylim=c(0,0.25), ylab="prob of ILI%", xlab="wk17|wk16", col="blue", yaxt="n")
lines((0:130)/10, sim.data.2[[i]][[UCSF2]], col="red", lwd=1)
lik.tmp <- 
sapply(1:length(model.names),function(k)
if(length(sim.data.2[[i]][[k]]) == 131){lines((0:130)/10, sim.data.2[[i]][[k]], col="gray", lwd=1)
                                        return(sim.data.2[[i]][[k]][floor(ILI.true*10)+1])
                                      }else{
                                        return(0)
                                      }
)
lines((0:130)/10, sim.data.2[[i]][[UCSF1]], col="blue",lwd=1)
lines((0:130)/10, sim.data.2[[i]][[UCSF2]], col="red",lwd=1)
lines((0:130)/10, sim.data.2[[i]][[(rank.avg[1])]], col="green",lwd=1)
abline(v=ILI.true, lty=2,lwd=1)
legend("topright",
       c(
         paste("UCSF1 rank:", which(order(-lik.tmp)==UCSF1)),
         paste("UCSF2 rank:", which(order(-lik.tmp)==UCSF2)),
         paste("best model rank:", which(order(-lik.tmp)==rank.avg[1]))
         ),
       col=c("blue","red", "green"),
       lty=c(1,1,1)         
)
legend("right", region.names[i], cex=1.5)
lik.tmp
})

mtext("week15|wk14 ILI% distribution", 1, outer=T, cex=2)
mtext("probability of ILI%", 2, outer=T, cex=2)

dev.off()

### plot 1
png("flu_comparison.png", width=12, height=8, units="in",res=300)
par(mfrow=c(4,3),mar=c(0.2, 0.5, 0.2, 0.2), oma=c(3,3,0,0))

plot.new()
legend("topleft",
       c("CDC flu data",
         "obs ILI at wk17",
         "Other Teams",
         paste("UCSF1 rank:", which(rank.avg==UCSF1)),
         paste("UCSF2 rank:", which(rank.avg==UCSF2)),
         paste("best model:", M.name[rank.avg[1]])
         ),
       col=c("black","black","gray","blue","red","green"),
       lty=c(1,2,1,1,1,1),
       lwd=c(3,2,1,1,1,1),
       cex=1.5
)

sapply(1:length(region.names),function(i){
ILI.true <- flu.data.all$ILI[flu.data.all$REGION == region.names[i]]
if(i>=9){
    plot(1:length(week2season(1:(head(wkID,1)-2))), ILI.true[1:length(week2season(1:(head(wkID,1)-2)))], xlim=c(1, 4+length(week2season(1:(head(wkID,1)-2)))), ylim=c(0.3, 8),type="l",lwd=3, ylab="ILI%", xlab="Week", xaxt="n")
    axis(side=1, at=c(1: (length(week2season(1:(head(wkID,1)-2)))+4)), labels=week2season(c(1: (length(week2season(1:(head(wkID,1)-2)))+4))))
}
if(i<9)plot(1:length(week2season(1:(head(wkID,1)-2))), ILI.true[1:length(week2season(1:(head(wkID,1)-2)))], xlim=c(1, 4+length(week2season(1:(head(wkID,1)-2)))), ylim=c(0.3, 8),type="l",lwd=3, ylab="ILI%", xlab="Week", xaxt="n")
sapply(1:length(model.names),function(k)
if(length(sim.data[[i]][[k]]) == 5)lines(tail(c(1: (length(week2season(1:(head(wkID,1)-2)))+4)), 5), sim.data[[i]][[k]], col="gray")
)
lines(tail(c(1: (length(week2season(1:(head(wkID,1)-2)))+4)), 5), sim.data[[i]][[UCSF1]], col="blue")
lines(tail(c(1: (length(week2season(1:(head(wkID,1)-2)))+4)), 5), sim.data[[i]][[UCSF2]], col="red")
lines(tail(c(1: (length(week2season(1:(head(wkID,1)-2)))+4)), 5)[1:length(sim.data[[i]][[rank.avg[1]]])], sim.data[[i]][[rank.avg[1]]], col="green")
lines(tail(1:length(week2season(1:(head(wkID,1)-1))), 2), tail(ILI.true,2), lty=2, lwd=2)
legend("topleft", region.names[i], cex=1.5)
})

mtext("week", 1, outer=T, cex=2)
mtext("ILI%", 2, outer=T, cex=2)

dev.off()



tab.rank <- data.frame(
              model.names.2, 
              sapply(1:length(model.names.2),function(k)which(rank.avg==k)), 
              sapply(1:ncol(rank.all),function(i)sapply(1:length(model.names.2),function(k)which(rank.all[,i]==k)))
              )

names(tab.rank) <- c("model", "rank.avg", paste("rank.",region.names,sep=""))
tab.rank$model <- gsub("-2016-12-05.csv", "", tab.rank$model)
tab.rank
write.csv(tab.rank,"tab.rank.CSV")


system("convert flu_comparison.png flu_comparison.2.png -append flu_comparison_all.png")



