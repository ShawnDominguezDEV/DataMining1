library(datasets)
data(airquality)
View(airquality)

##### Basic Statistics  #####

#Question 1A
head(airquality, 4)

#Question 1B -- Not displaying only wind
airquality[airquality$Wind > quantile(airquality$Wind, prob=1-(5/100)),]

#Question 1C
SolarX <- c(airquality$Solar.R)
is.na(SolarX)
mean(SolarX, na.rm=T)
fivenum(airquality$Solar.R)
  #Left Skewed

#Question 1D
subMay = subset(airquality, Month == "5")
subJune = subset(airquality, Month == "6")
t.test(subMay[1:30,]$Temp,subJune[1:30,]$Temp, alternative ="two.sided", var.equal = TRUE, mu=0)
  #p-value = 4.102e-11
  #Reject the equality of means

##### Visualization #####

#Question 2A
boxplot(airquality$Temp, col = "blue",main="Boxplot for Temperature" ,xlab = "Temp", horizontal = TRUE)
abline(v = mean(airquality$Temp), col = "Red", lwd = 4)
  #Skewed Left? Mean is left of the median.

#Question 2B
boxplot(Ozone ~ Month, data = airquality, col = "green", main = "Ozone by Month", xlab = "Month", ylab = "Ozone Levels")
  #From June to August, the overall mean in the Ozone levels saw an increase.

#Question 2C
hist(airquality$Solar.R, col = "green", breaks = 20)
rug(airquality$Solar.R)
  #Right Skewed? Higher density on the right side.

#Question 2D
graphics.off() 
split.screen(c(2,2))
screen(1)
with(subset(airquality, Month == "5"), plot(x=Temp, y=Solar.R, xlab = "Temperature", ylab = "Solar Radiation", ylim=c(0,350), xlim=c(55,100), main = "May"))
screen(2)
with(subset(airquality, Month == "6"), plot(x=Temp, y=Solar.R, xlab = "Temperature", ylab = "Solar Radiation", ylim=c(0,350), xlim=c(55,100), main = "June"))
screen(3)
with(subset(airquality, Month == "7"), plot(x=Temp, y=Solar.R, xlab = "Temperature", ylab = "Solar Radiation", ylim=c(0,350), xlim=c(55,100), main = "July"))
screen(4)
with(subset(airquality, Month == "8"), plot(x=Temp, y=Solar.R, xlab = "Temperature", ylab = "Solar Radiation", ylim=c(0,350), xlim=c(55,100), main = "August"))

#Question 2E
graphics.off()
with(airquality, plot(Solar.R, Wind, ylim=c(0,25), xlim=c(0,350), col = Temp))
with(subset(pollution, Temp == "west"), points(latitude, pm25,col = "blue",pch=1))
with(subset(pollution, region == "east"), points(latitude, pm25,col = "red",pch=2))
legend("topright", pch = c(1,2), col = c("blue", "red"), legend = c("West", "East"))
