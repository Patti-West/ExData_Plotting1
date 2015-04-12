# Same as before - reading and preparing the dataset

setwd("~/Coursera")
power_all <- read.table("~/Coursera/household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")
power_all$Date1 <-strptime(power_all$Date, "%d/%m/%Y")
power <- subset(power_all,Date1=="2007-02-01"|Date1=="2007-02-02")
power$Date2 <-strptime(paste(power$Date,power$Time),"%d/%m/%Y%H:%M:%S")
rm(power_all)

# Plot 4

png('plot4.png',width = 480, height = 480, units = "px")
par(mfrow = c(2, 2))
plot(power$Date2,power$Global_active_power,xlab="",ylab="Global Active Power",type="l")
plot(power$Date2,power$Voltage,xlab="datetime",ylab="Voltage",type="l")
plot(power$Date2,power$Sub_metering_1,type="l",ylab="Energy sub metering",xlab="")
points(power$Date2,power$Sub_metering_2,type="l",col="red")
points(power$Date2,power$Sub_metering_3,type="l",col="blue")
legend("topright", lwd = 1, col = c("black","red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
plot(power$Date2,power$Global_reactive_power,xlab="datetime",ylab="Global_reactive_power",type="l")
dev.off()