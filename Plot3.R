# Same as before- reading and preparing the data set

setwd("~/Coursera")
power_all <- read.table("~/Coursera/household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")
power_all$Date1 <-strptime(power_all$Date, "%d/%m/%Y")
power <- subset(power_all,Date1=="2007-02-01"|Date1=="2007-02-02")
power$Date2 <-strptime(paste(power$Date,power$Time),"%d/%m/%Y%H:%M:%S")
rm(power_all)

# Plot 3
png('plot3.png',width = 480, height = 480, units = "px")
plot(power$Date2,power$Sub_metering_1,type="l",ylab="Energy sub metering",xlab="")
points(power$Date2,power$Sub_metering_2,type="l",col="red")
points(power$Date2,power$Sub_metering_3,type="l",col="blue")
legend("topright", lwd = 1, col = c("black","red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
dev.off()
