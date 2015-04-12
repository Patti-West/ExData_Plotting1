#Same as before - reading and preparing the data set

setwd("~/Coursera")
power_all <- read.table("~/Coursera/household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")
power_all$Date1 <-strptime(power_all$Date, "%d/%m/%Y")
power <- subset(power_all,Date1=="2007-02-01"|Date1=="2007-02-02")
power$Date2 <-strptime(paste(power$Date,power$Time),"%d/%m/%Y%H:%M:%S")
rm(power_all)

#plot 2

png('plot2.png',width = 480, height = 480, units = "px")
plot(power$Date2,power$Global_active_power,xlab="",ylab="Global Active Power (kilowatts)",type="l")
dev.off()
