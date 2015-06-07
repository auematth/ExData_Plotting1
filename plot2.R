
# Exploratory Data Analysis / Assignment 1
#
# Creation of plot2.png


#########################
##### Loading the data

# Load all
hh_power_con <- read.csv("household_power_consumption.txt", sep=";", dec = ".")

# Filter: Only data from 2007-02-01 and 2007-02-02 is relevant
hh_power_con$datetime <- paste(hh_power_con$Date, hh_power_con$Time)
hh_power_con_sub <- subset(hh_power_con, hh_power_con$Date == '1/2/2007' | hh_power_con$Date == '2/2/2007') 
hh_power_con_sub$Date2 <- as.Date(strptime(hh_power_con_sub$datetime, "%m/%d/%Y %H:%M:%S"))  


#########################
##### Making Plot 02

## Change data format
hh_power_con_sub <- subset(hh_power_con_sub,  is.na(hh_power_con_sub$Global_active_power) == FALSE)
hh_power_con_sub$Global_active_power <- as.numeric(as.character(hh_power_con_sub$Global_active_power), dec = ".")

# Make plot
plot(hh_power_con_sub$Global_active_power, type = "l", ylab = "Global active power (kilowatts)", xlab = "")

# Save plot as png 
library(datasets)
plot(hh_power_con_sub$Global_active_power, type = "l", ylab = "Global active power (kilowatts)", xlab = "")
dev.copy(png, file = "plot2.png") 
dev.off() ## Close the PNG device!
