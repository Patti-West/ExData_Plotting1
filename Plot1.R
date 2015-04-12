# Repeating the code on reading in the file each time because the instructions implied it was necessary.

setwd("~/Coursera")

# read in the source file
power_all <- read.table("~/Coursera/household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")

# Convert the date so I can subset out the days I want
power_all$Date1 <-strptime(power_all$Date, "%d/%m/%Y")
power <- subset(power_all,Date1=="2007-02-01"|Date1=="2007-02-02")

# Convert the time so I can use that as a factor in my charts
power$Date2 <-strptime(paste(power$Date,power$Time),"%d/%m/%Y%H:%M:%S")

# Get rid of the big data set
rm(power_all)

# Plot 1
png('plot1.png',width = 480, height = 480, units = "px")
hist(power$Global_active_power,main="Global Active Power",xlab="Global Active Power (kilowatts)",col="red")
dev.off()

