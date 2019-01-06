Region.name <- 
structure(c(2L, 3L, 4L, 5L, 6L, 7L, 8L, 9L, 10L, 11L, 12L, 13L, 
14L, 15L, 16L, 17L, 18L, 19L, 20L, 21L, 22L, 23L, 24L, 25L, 26L, 
27L, 28L, 29L, 30L, 31L, 32L, 33L, 34L, 36L, 37L, 38L, 39L, 40L, 
41L, 44L, 45L, 46L, 47L, 48L, 49L, 50L, 52L, 53L, 54L, 55L, 56L, 
35L, 51L, 42L), .Label = c("", "Alabama", "Alaska", "Arizona", 
"Arkansas", "California", "Colorado", "Connecticut", "Delaware", 
"District of Columbia", "Florida", "Georgia", "Hawaii", "Idaho", 
"Illinois", "Indiana", "Iowa", "Kansas", "Kentucky", "Louisiana", 
"Maine", "Maryland", "Massachusetts", "Michigan", "Minnesota", 
"Mississippi", "Missouri", "Montana", "Nebraska", "Nevada", "New Hampshire", 
"New Jersey", "New Mexico", "New York", "New York City", "North Carolina", 
"North Dakota", "Ohio", "Oklahoma", "Oregon", "Pennsylvania", 
"Puerto Rico", "REGION", "Rhode Island", "South Carolina", "South Dakota", 
"Tennessee", "Texas", "Utah", "Vermont", "Virgin Islands", "Virginia", 
"Washington", "West Virginia", "Wisconsin", "Wyoming"), class = "factor")
Region.name <- as.character(Region.name)

##########################################################
############# Data Loading  ##############################
##########################################################
rm(list=ls())
week2season <- function(k)c((40:53),(1:39))[k]
week2season(5)

#wkID <- (5:8) + (0)
wkID <- (4:7) + (9) # EW51

week2season(wkID)

system("ls ./data/*.csv")

flu.data <- read.csv("./data/ILINetCA.csv", header=F)[-(1:2),]
names(flu.data) <- as.character(read.csv("./data/ILINet.csv", header=F, colClasses="character")[2,])
flu.data <- flu.data[flu.data$REGION=="California",]
head(flu.data)
flu.data <- flu.data[,-5]
names(flu.data)[5] <- "ILI"
head(flu.data)
tail(flu.data)
#flu.data <- flu.data[-which(flu.data$ILI=="X"),]

flu.data$ILI <- as.numeric(as.character(flu.data$ILI))
flu.data$YEAR <- as.numeric(as.character(flu.data$YEAR))
flu.data$WEEK <- as.numeric(as.character(flu.data$WEEK))
#flu.data$ILI <- signif(flu.data$ILI,2)

flu.data.wk.prev <- flu.data[,c("YEAR","WEEK","ILI")]
flu.data.wk.prev$WEEK <- flu.data.wk.prev$WEEK - 39
flu.data.wk.prev$YEAR[flu.data.wk.prev$WEEK<=0] <- flu.data.wk.prev$YEAR[flu.data.wk.prev$WEEK<=0] -1
flu.data.wk.prev$WEEK[flu.data.wk.prev$WEEK<=0] <- flu.data.wk.prev$WEEK[flu.data.wk.prev$WEEK<=0] + 53
tail(flu.data.wk.prev)
flu.data.wk.prev <- flu.data.wk.prev[flu.data.wk.prev$WEEK>=(head(wkID,1)-3) & flu.data.wk.prev$WEEK<=tail(wkID+1,1),]
## flu.data.wk.prev <- flu.data.wk.prev[
## (flu.data.wk.prev$YEAR<2016 & flu.data.wk.prev$WEEK>=head(wkID,1) & flu.data.wk.prev$WEEK<=tail(wkID,1)) |
## (flu.data.wk.prev$YEAR==2016 & flu.data.wk.prev$WEEK<=tail(wkID+1,1))
## ,]

tmp.ILI <- tail(flu.data.wk.prev$ILI[flu.data.wk.prev$YEAR==2018], 1)
tmp.WEEK <- tail(flu.data.wk.prev$WEEK[flu.data.wk.prev$YEAR==2018], 1)
tmp.YEAR <- flu.data.wk.prev$YEAR[(flu.data.wk.prev$WEEK==tmp.WEEK) & (flu.data.wk.prev$ILI >= (tmp.ILI-0.3)) & (flu.data.wk.prev$ILI <= (tmp.ILI+0.3))]
#if(length(tmp.YEAR)==2)tmp.YEAR = max(tmp.YEAR)
tmp.rows <- sapply(1:length(tmp.YEAR), function(k)which(flu.data.wk.prev$YEAR == tmp.YEAR[k]))
tmp.rows <- unlist(tmp.rows)
flu.data.wk.prev <- flu.data.wk.prev[tmp.rows,]


flu.data.yr.prev <- flu.data[,c("YEAR","WEEK","ILI")]
flu.data.yr.prev$WEEK <- flu.data.yr.prev$WEEK - 39
flu.data.yr.prev$YEAR[flu.data.yr.prev$WEEK<=0] <- flu.data.yr.prev$YEAR[flu.data.yr.prev$WEEK<=0] -1
flu.data.yr.prev$WEEK[flu.data.yr.prev$WEEK<=0] <- flu.data.yr.prev$WEEK[flu.data.yr.prev$WEEK<=0] + 53
head(flu.data.yr.prev)
tail(flu.data.yr.prev)
flu.data.yr.prev <- flu.data.yr.prev[-nrow(flu.data.yr.prev), ]
flu.data.yr.prev
#####################################
#####################################

flu.data.yr.prev
tmp.pk.week <- 
lapply(min(flu.data.yr.prev$YEAR) : max(flu.data.yr.prev$YEAR), function(yr){
  flu.data.yr.prev$WEEK[which(flu.data.yr.prev$YEAR==yr & flu.data.yr.prev$ILI >= -0.1+max(flu.data.yr.prev$ILI[flu.data.yr.prev$YEAR==yr]) & flu.data.yr.prev$ILI <= 0.1+max(flu.data.yr.prev$ILI[flu.data.yr.prev$YEAR==yr]))]
})

years <- min(flu.data.yr.prev$YEAR) : max(flu.data.yr.prev$YEAR)
flu.data.yr.prev.pk.wk <- vector()
for(ii in 1:length(tmp.pk.week)){
  for(kk in 1:length(tmp.pk.week[[ii]])){
    flu.data.yr.prev.pk.wk <- rbind(flu.data.yr.prev.pk.wk, c(years[ii], tmp.pk.week[[ii]][kk]))
  }
}


tmp.pk.prev <- 
lapply(min(flu.data.yr.prev$YEAR) : max(flu.data.yr.prev$YEAR), function(yr){
  flu.data.yr.prev$ILI[which(flu.data.yr.prev$YEAR==yr & flu.data.yr.prev$ILI >= -0.1+max(flu.data.yr.prev$ILI[flu.data.yr.prev$YEAR==yr]) & flu.data.yr.prev$ILI <= 0.1+max(flu.data.yr.prev$ILI[flu.data.yr.prev$YEAR==yr]))]
})

years <- min(flu.data.yr.prev$YEAR) : max(flu.data.yr.prev$YEAR)
flu.data.yr.prev.pk.prev <- vector()
for(ii in 1:length(tmp.pk.prev)){
  for(kk in 1:length(tmp.pk.prev[[ii]])){
    flu.data.yr.prev.pk.prev <- rbind(flu.data.yr.prev.pk.prev, c(years[ii], tmp.pk.prev[[ii]][kk]))
  }
}



##########################################################
##########################################################
##########################################################

################################################################
############# Logistic Regression ##############################
################################################################
sim.forecast.ili.LIST <- list()
for(j in 1:50){

err.ILI.cv <- -Inf
while(sum(is.infinite(err.ILI.cv))>0 | sum(is.na(err.ILI.cv)) >0){

X.input <- data.frame(year=flu.data.wk.prev$YEAR, week=flu.data.wk.prev$WEEK)
Y.output <- data.frame(ili=flu.data.wk.prev$ILI)

head(X.input)
tail(X.input)
head(Y.output)
tail(Y.output)

id.random <- which(X.input$year>=1997)
#id.random <- which(X.input$year>=2010)
#id.random <- which(X.input$year>=2011)
id.random <- sample(id.random, length(id.random))
#id.random <- sample(1:length(id.random), length(id.random))
id.test <- which(X.input$year>=2015)

id.random1 <- id.random[1:floor(length(id.random)*0.8)]
id.random2 <- id.random[floor(length(id.random)*0.8):length(id.random)]

scale <- 10 # 1: 130 bins, 10: 1300 bins

### training data set and Standardization/Rescaling ###
#X.data <- X.input[id.random1,] 
X.data <- as.data.frame(X.input[id.random1,-1] )
X.mean <- sapply(X.data, mean)
X.sd <- sapply(X.data, sd)
X.min <- sapply(X.data, min)
X.max <- sapply(X.data, max)
X.data <- sapply(X.data, function(tmp)(tmp-mean(tmp))/sd(tmp)) # Standardization
#X.data <- sapply(X.data, function(tmp)(tmp-min(tmp))/(max(tmp)-min(tmp))) # Rescaling
##############################################

### test data set ###
#X.input[id.2011,]$year <- 2020
#X.input[id.2011,]$year <- 2011
#X.input[id.2011,]$year <- 2012
#X.input[id.2011,]$year <- 2015
X.test <- t(sapply(1:length(id.test),function(k)(X.input[id.test[k],-1]-X.mean)/X.sd)) # Standardization
#X.test <- t(sapply(1:length(id.test),function(k)(X.input[id.test[k],]-X.mean)/X.sd)) # Standardization

X.test <- (t(X.test)) # if input is week only
X.test <- cbind(rep(1,nrow(X.test)), X.test)
X.test <- matrix(unlist(X.test), nrow(X.test), ncol(X.test))

## X.forecast <- tail(X.input[,],4)
## X.forecast$year <- 2016
## X.forecast$week <- wkID

X.forecast <- tail(X.input[,-1],4)
X.forecast <- wkID

X.forecast <- as.matrix(X.forecast)
X.forecast <- t(sapply(1:4,function(k)(X.forecast[k,]-X.mean)/X.sd)) # Standardization

X.forecast <- (t(X.forecast)) # if input is week only
X.forecast <- cbind(rep(1,nrow(X.forecast)), X.forecast)
X.forecast <- matrix(unlist(X.forecast), nrow(X.forecast), ncol(X.forecast))

#####################

### cross valication data set ###
X.cv <- t(sapply(1:length(id.random2),function(k)(X.input[id.random2[k],-1]-X.mean)/X.sd)) # Standardization
#X.cv <- t(sapply(1:length(id.random2),function(k)(X.input[id.random2[k],]-X.mean)/X.sd)) # Standardization

X.cv <- t(X.cv) # if input is week only
X.cv <- cbind(rep(1,nrow(X.cv)), X.cv)
X.cv <- matrix(unlist(X.cv), nrow(X.cv), ncol(X.cv))
#####################

### initialize paraemters and variables ###
Theta <- matrix(rep(0, 1+ncol(X.data)), 1+ncol(X.data), 1)
X <- matrix( unlist(cbind(rep(1, nrow(X.data)),X.data)), nrow(X.data), 1+ncol(X.data))

Y.data <- floor(scale*Y.output$ili[id.random1]) == 0
Y <- matrix(Y.data*scale, nrow=length(id.random1), ncol=1)

m <- nrow(X) # number of examples
lambda <- 0.01 # regularization param, under fit if too large, over fit if to small

J <- 0
Theta.grad <- rep(0, length(Theta)) # initial parameter Thata
###########################################

### hypothesis function ###
hypo <- function(Theta){
  1/(1+exp(-1*(X %*% Theta))) # hypothesis function
}
#h.prob <- hypo(Theta) 
###########################

### cost function ###
cost.fn <- function(Theta){
  h.prob <- hypo(Theta) # hypothesis function
  J <- sum(Y * -log(h.prob) + (1-Y) * (-log(1-h.prob)))/m # cost function
  J <- J + sum(lambda/(2*m)*(Theta[-1])^2) # regularization term
  return(J)
}
#####################

### gradient function ###
grad.fn <- function(Theta){
  h.prob <- hypo(Theta) # hypothesis function
  Theta.grad <- apply(X, 2, function(xj)sum((h.prob - Y) * xj)/m) # dCost/dTheta
  Theta.grad <- Theta.grad + c(0, lambda/m * Theta[-1]) # regularization term
  return(Theta.grad)
}
########################

## forecast function ###
forecast <- function(Theta, X){
  1/(1+exp(-1*(X %*% Theta))) 
}
########################

## forecast Error function ###
cost.ERR <- function(Theta, X, Y){
  h.prob <- forecast(Theta, X) # hypothesis function
  J <- sum(Y * -log(h.prob) + (1-Y) * (-log(1-h.prob)))/nrow(X) # cost function
  return(J)
}
########################

################################################################
################################################################
################################################################
ILI.Theta <- list()
err.ILI.train <- vector()
err.ILI.cv <- vector()

for( i in (-5:11)){# big loop
lambda <- (2^(i/1))/100
##############################################
###### ILI prediction using test-dataset ######
##############################################
Theta.all <- vector()
system.time(
for(kk in 0:130){
  Y.data <- floor(scale*Y.output$ili[id.random1]) == kk
  #Y <- matrix(Y.data*scale, nrow=length(id.random1), ncol=1)
  Y <- matrix(Y.data, nrow=length(id.random1), ncol=1)
  Theta.optm <- optim(par=Theta, fn=cost.fn, gr=grad.fn, method="BFGS")
  #Theta.optm <- optim(par=Theta, fn=cost.fn, method="Nelder-Mead")
  Theta.optm <- Theta.optm$par
  Theta.all <- cbind(Theta.all, Theta.optm)
}
)

ILI.Theta <- c(ILI.Theta, list(Theta.all))

err.ILI.tmp <- vector()
for(kk in 0:130){
  Y.data <- floor(scale*Y.output$ili[id.random1]) == kk
  #Y <- matrix(Y.data*scale, nrow=length(id.random1), ncol=1)
  Y <- matrix(Y.data*1, nrow=length(id.random1), ncol=1)
  tmp <- cost.ERR(Theta.all[,(kk+1)], X, Y)
  err.ILI.tmp <- c(err.ILI.tmp, tmp)
}
err.ILI.train <- c(err.ILI.train, sum(err.ILI.tmp))

err.ILI.cv.tmp <- vector()
for(kk in 0:130){
  Y.data.cv <- floor(scale*Y.output$ili[id.random2]) == kk
  #Y.cv <- matrix(Y.data.cv*scale, nrow=length(id.random2), ncol=1)
  Y.cv <- matrix(Y.data.cv*1, nrow=length(id.random2), ncol=1)
  tmp <- cost.ERR(Theta.all[,(kk+1)], X.cv, Y.cv)
  err.ILI.cv.tmp <- c(err.ILI.cv.tmp, tmp)
}
err.ILI.cv <- c(err.ILI.cv, sum(err.ILI.cv.tmp))

##############################################
##############################################
##############################################

}# big loop

} # end of while()

D <- length(err.ILI.train) - 1
total.cost <- c(err.ILI.train, err.ILI.cv)
plot(2^(0:D)/100, err.ILI.cv, type="l", ylim=c(min(total.cost), max(total.cost)), col="green", xlab="lambda", ylab="cost")
lines(2^(0:D)/100, err.ILI.train, type="l", col="red")

lambda.ili.id <- which((err.ILI.cv) == min(err.ILI.cv))[1]

#lambda.ili.id <- which((err.ILI.cv+err.ILI.train) == min(err.ILI.cv+err.ILI.train))[1]

#lambda.tf.id <- which((err.TF.cv+err.TT.cv) == min(err.TF.cv+err.TT.cv))
#lambda.tt.id <- which((err.TF.cv+err.TT.cv) == min(err.TF.cv+err.TT.cv))

##############################################
##############################################
##############################################
### forecasts of test data 2014/2015, 2015/2016
sim.test.ili <- vector()
for(k in 1:length(id.test)){
  tmp <- c(forecast(ILI.Theta[[lambda.ili.id]], X.test[k,]))
  sim.test.ili <- cbind(sim.test.ili, tmp/sum(tmp))
}

## ILI
sim.test.ili.avg <- apply(sim.test.ili, 1, mean)

ili.mean.lr <- sum(sim.test.ili.avg*c(0:130))/scale
ili.loglik.lr <- sum(log(sim.test.ili.avg[1+floor(scale*Y.output$ili[id.test])]))

ili.mean.true <- mean(Y.output$ili[id.test])

plot.ILI <- function(){
plot((0:130)/10, sim.test.ili[,1], type="l", main="TEST: CA flu seasons 2015/2016, 2016/2018", xlab="%ILI", ylab="density", ylim=c(0,0.1))
abline(v=(scale*Y.output$ili[id.test])/10, col="grey")
sapply(1:ncol(sim.test.ili),function(kk)lines((0:130)/10, sim.test.ili[,kk], type="l"))
}

### forecasts of test data 2016/2018
sim.forecast.ili <- vector()
for(k in 1:nrow(X.forecast)){
  tmp <- c(forecast(ILI.Theta[[lambda.ili.id]], X.forecast[k,]))
  sim.forecast.ili <- cbind(sim.forecast.ili, tmp/sum(tmp))
}

plot.ILI.forecast <- function(){
plot((0:130)/10, sim.forecast.ili[,1], type="l", main="FORECAST: CA flu seasons 2018/2019 1-4 weeks", xlab="%ILI", ylab="density", ylim=c(0,0.1))
sapply(1:ncol(sim.forecast.ili),function(kk)lines((0:130)/10, sim.forecast.ili[,kk], type="l"))
}

sum(sim.forecast.ili[,1]*(0:130))
##############################
###### plot results ##########
##############################

png("./plots/CA 1-4 week forecast.png",width=6,height=8,units="in",res=150)

par(mfrow = c(3,1))
plot(2^(0:D)/100, err.ILI.cv, type="l", col="green", xlab="lambda", ylab="cost", ylim=c(min(c(err.ILI.cv, err.ILI.train)), max(c(err.ILI.cv, err.ILI.train))))
lines(2^(0:D)/100, err.ILI.train, type="l", col="red")
legend("bottomright", c("training Error","cross validation Error"), lty=1, col=c("red", "green"))
plot.ILI()
plot.ILI.forecast()

dev.off()
##############################
##############################
##############################

sim.forecast.ili.LIST <- c(sim.forecast.ili.LIST, list(sim.forecast.ili))
} # external for-loop

tmp <- sim.forecast.ili.LIST[[1]]
for(i in 2:length(sim.forecast.ili.LIST)){
  tmp <- tmp + sim.forecast.ili.LIST[[i]]
}

sim.forecast.ili <- tmp/length(sim.forecast.ili.LIST)

avg.ili <- sapply(1:length(sim.forecast.ili.LIST), function(k)apply(sim.forecast.ili.LIST[[k]], 2, function(x)sum(x*(0:130))))

data.smooth <- 
sapply(1:ncol(sim.forecast.ili), function(k){
tmp.mean <- sum(c(0:130)/10*sim.forecast.ili[,k])
#tmp.sd <- sd(sample(x=(0:130)/10, 10000, replace=T, prob=sim.forecast.ili[,k]))/2
tmp.sd <- sd(sample(x=(0:130)/10, 10000, replace=T, prob=sim.forecast.ili[,k]))/1
tmp <- dnorm(x=(0:130)/10, mean=tmp.mean, sd=tmp.sd)
tmp/sum(tmp)
})

national4wks <- read.csv("national1-4wk.forecast.template.csv")
head(national4wks)
national4wks$Location <- paste("California",sep="")
nrow(national4wks)

national4wks$Value[1] <- signif(sum((0:130)*sim.forecast.ili[,1])/10, 2)
national4wks$Value[1+132] <- signif(sum((0:130)*sim.forecast.ili[,2])/10, 2)
national4wks$Value[1+132+132] <- signif(sum((0:130)*sim.forecast.ili[,3])/10, 2)
national4wks$Value[1+132+132+132] <- signif(sum((0:130)*sim.forecast.ili[,4])/10, 2)

national4wks$Value[(2):(2+130)] <- signif(sim.forecast.ili[,1],2)
national4wks$Value[(2+130+2):(2+130+2+130)] <- signif(sim.forecast.ili[,2],2)
national4wks$Value[(2+130+2+130+2):(2+130+2+130+2+130)] <- signif(sim.forecast.ili[,3],2)
national4wks$Value[(2+130+2+130+2+130+2):(2+130+2+130+2+130+2+130)] <- signif(sim.forecast.ili[,4],2)

head(national4wks)

write.csv(national4wks, "./output/ca4wks.csv", row.names=F)


for(k in 1:ncol(sim.forecast.ili)){
  sim.forecast.ili[,k] <- data.smooth[,k]
}

national4wks <- read.csv("national1-4wk.forecast.template.csv")
head(national4wks)
national4wks$Location <- paste("California",sep="")
nrow(national4wks)

national4wks$Value[1] <- signif(sum((0:130)*sim.forecast.ili[,1])/10, 2)
national4wks$Value[1+132] <- signif(sum((0:130)*sim.forecast.ili[,2])/10, 2)
national4wks$Value[1+132+132] <- signif(sum((0:130)*sim.forecast.ili[,3])/10, 2)
national4wks$Value[1+132+132+132] <- signif(sum((0:130)*sim.forecast.ili[,4])/10, 2)

national4wks$Value[(2):(2+130)] <- signif(sim.forecast.ili[,1],2)
national4wks$Value[(2+130+2):(2+130+2+130)] <- signif(sim.forecast.ili[,2],2)
national4wks$Value[(2+130+2+130+2):(2+130+2+130+2+130)] <- signif(sim.forecast.ili[,3],2)
national4wks$Value[(2+130+2+130+2+130+2):(2+130+2+130+2+130+2+130)] <- signif(sim.forecast.ili[,4],2)

head(national4wks)

write.csv(national4wks, "./output/ca4wksSMOOTH.csv", row.names=F)




flu.data.wk.prev$ILI[flu.data.wk.prev$YEAR==2018]

projection <- apply(avg.ili,2, function(x)c(flu.data.wk.prev$ILI[flu.data.wk.prev$YEAR==2018], x/10))
png("./plots/forecastCA.png")
plot((head(wkID,1)-3):(tail(wkID,1)), projection[,1], lty=2,type="l", col="grey", xlab="wk", ylab="ILI%", ylim=c(0.2,7) , main="CA 1-4 wk ahead", xaxt="n")
axis(1, at=(head(wkID,1)-3):(tail(wkID,1)),labels=c(week2season(wkID-3), week2season(wkID)[-1]))
sapply(1:ncol(projection),function(k)lines((head(wkID,1)-3):(tail(wkID,1)),projection[,k], lty=2,type="l", col="grey"))
lines((head(wkID,1)-3):((head(wkID,1))-1), flu.data.wk.prev$ILI[flu.data.wk.prev$YEAR==2018], lwd=3)
lines(((head(wkID,1))-1):(tail(wkID,1)), c(tail(flu.data.wk.prev$ILI,1), apply(avg.ili, 1, mean)/10), lty=2, col="red",lwd=3)
dev.off()

apply(avg.ili, 1, mean)


