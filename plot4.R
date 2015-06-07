
# Exploratory Data Analysis / Assignment 1
#
# Creation of plot4.png


#########################
##### Loading the data

# Load all
hh_power_con <- read.csv("household_power_consumption.txt", sep=";", dec = ".")

# Filter: Only data from 2007-02-01 and 2007-02-02 is relevant
hh_power_con$datetime <- paste(hh_power_con$Date, hh_power_con$Time)
hh_power_con_sub <- subset(hh_power_con, hh_power_con$Date == '1/2/2007' | hh_power_con$Date == '2/2/2007') 
hh_power_con_sub$Date2 <- as.Date(strptime(hh_power_con_sub$datetime, "%m/%d/%Y %H:%M:%S"))  


#########################
##### Making Plot 04

## Change data formats
hh_power_con_sub <- subset(hh_power_con_sub,  is.na(hh_power_con_sub$Global_active_power) == FALSE)
hh_power_con_sub$Global_active_power <- as.numeric(as.character(hh_power_con_sub$Global_active_power), dec = ".")
hh_power_con_sub$Voltage <- as.numeric(as.character(hh_power_con_sub$Voltage), dec = ".")
hh_power_con_sub$Global_reactive_power <- as.numeric(as.character(hh_power_con_sub$Global_reactive_power), dec = ".")
hh_power_con_sub$Sub_metering_1 <- as.numeric(as.character(hh_power_con_sub$Sub_metering_1), dec = ".")
hh_power_con_sub$Sub_metering_2 <- as.numeric(as.character(hh_power_con_sub$Sub_metering_2), dec = ".")
hh_power_con_sub$Sub_metering_3 <- as.numeric(as.character(hh_power_con_sub$Sub_metering_3), dec = ".")


# Make plots and save as png 
library(datasets)
par(mfrow = c(2, 2))
with(hh_power_con_sub, {
  plot(hh_power_con_sub$Global_active_power, type = "l", ylab = "Global active power (kilowatts)", xlab = "")
  plot(hh_power_con_sub$Voltage, type = "l", ylab = "Voltage", xlab = "datetime")
  plot(hh_power_con_sub$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "datetime")
  lines(hh_power_con_sub$Sub_metering_2, col = "red")
  lines(hh_power_con_sub$Sub_metering_3, col = "blue")
  legend(1220,39, c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), cex=0.4, lty=c(1,1,1), lwd=c(0.5,0.5, 0.5),col=c("black","red","blue"))
  plot(hh_power_con_sub$Global_reactive_power, type = "l", ylab = "Global_reactive_power", xlab = "datetime")  
})
dev.copy(png, file = "plot4.png") 
dev.off() ## Close the PNG device!
