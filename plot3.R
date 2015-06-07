
# Exploratory Data Analysis / Assignment 1
#
# Creation of plot3.png


#########################
##### Loading the data

# Load all
hh_power_con <- read.csv("household_power_consumption.txt", sep=";", dec = ".")

# Filter: Only data from 2007-02-01 and 2007-02-02 is relevant
hh_power_con$datetime <- paste(hh_power_con$Date, hh_power_con$Time)
hh_power_con_sub <- subset(hh_power_con, hh_power_con$Date == '1/2/2007' | hh_power_con$Date == '2/2/2007') 
hh_power_con_sub$Date2 <- as.Date(strptime(hh_power_con_sub$datetime, "%m/%d/%Y %H:%M:%S"))  


#########################
##### Making Plot 03

## Change data format
hh_power_con_sub$Sub_metering_1 <- as.numeric(as.character(hh_power_con_sub$Sub_metering_1), dec = ".")
hh_power_con_sub$Sub_metering_2 <- as.numeric(as.character(hh_power_con_sub$Sub_metering_2), dec = ".")
hh_power_con_sub$Sub_metering_3 <- as.numeric(as.character(hh_power_con_sub$Sub_metering_3), dec = ".")

# Make plot
plot(hh_power_con_sub$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
lines(hh_power_con_sub$Sub_metering_2, col = "red")
lines(hh_power_con_sub$Sub_metering_3, col = "blue")
legend(1180,39, c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1), lwd=c(2.5,2.5, 2.5),col=c("black","red","blue"))

# Save plot as png 
library(datasets)
plot(hh_power_con_sub$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
lines(hh_power_con_sub$Sub_metering_2, col = "red")
lines(hh_power_con_sub$Sub_metering_3, col = "blue")
legend(1180,39, c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1), lwd=c(2.5,2.5, 2.5),col=c("black","red","blue"))
dev.copy(png, file = "plot3.png") 
dev.off() ## Close the PNG device!
