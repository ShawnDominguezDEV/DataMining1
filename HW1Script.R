data(avgpm25)
attach(avgpm25)
summary(avgpm25)

#Questions 1A-1E
head(avgpm25,5)
names(avgpm25)
fivenum(pm25)
boxplot(avgpm25$pm25,lim=c(0,20), col = 2, main = "Boxplot for Particle Pollution")
boxplot(avgpm25$pm25 ~ avgpm25$region, col = "red", main="Boxplot for Particle Pollution with Respect to Both Regions")
avg.pm25<-median(avgpm25$pm25)
library(datasets)
hist(avgpm25$pm25, breaks = 100, 
     xlab = "pm25", col="green", main = "Histogram of Particle Pollution")
rug(avgpm25$pm25, col = "magenta")
abline(v = median(avgpm25$pm25),lty = 1, lwd = 5, col = "magenta")


#ScatterPlot 1F
graphics.off() 
split.screen(c(1,2))
screen(1)
with(subset(avgpm25, region == "west"), plot(x=latitude, y=pm25, xlab = "Latitude", ylab = "Pollution", ylim=c(0,20), xlim=c(0,60), main = "West"))
screen(2)
with(subset(avgpm25, region == "east"), plot(x=latitude, y=pm25, xlab = "Latitude", ylab = "Pollution", ylim=c(0,20), xlim=c(0,60), main = "East"))




#Question 1G
pollutionWest = subset(avgpm25, region=="west", select = c(pm25))
pollutionEast = subset(avgpm25, region=="east", select = c(pm25))
t.test(pollutionWest[1:134,], pollutionEast[1:134,], alternative = "two.sided")


#Question 2 - LATTICE
library(lattice)
pollutionByLocation=data.frame(avgpm25$pm25, region=avgpm25$region)
xyplot(pm25~longitude | region, data=pollutionByLocation, layout=c(1, 2))
xyplot(pm25~longitude | region, data=pollutionByLocation, layout=c(2,1))



