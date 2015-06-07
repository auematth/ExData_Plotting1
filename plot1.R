
# Exploratory Data Analysis / Assignment 1
#
# Creation of plot1.png


#########################
##### Loading the data

# Load all
hh_power_con <- read.csv("household_power_consumption.txt", sep=";", dec = ".")

# Filter: Only data from 2007-02-01 and 2007-02-02 is relevant
hh_power_con$datetime <- paste(hh_power_con$Date, hh_power_con$Time)
hh_power_con_sub <- subset(hh_power_con, hh_power_con$Date == '1/2/2007' | hh_power_con$Date == '2/2/2007') 
hh_power_con_sub$Date2 <- as.Date(strptime(hh_power_con_sub$datetime, "%m/%d/%Y %H:%M:%S"))  


#########################
##### Making Plot 01

## Change data format
hh_power_con_sub <- subset(hh_power_con_sub,  is.na(hh_power_con_sub$Global_active_power) == FALSE)
hh_power_con_sub$Global_active_power <- as.numeric(as.character(hh_power_con_sub$Global_active_power), dec = ".")

# Make plot
hist(hh_power_con_sub$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global active power (kilowatts)")

# Save plot as png 
library(datasets)
hist(hh_power_con_sub$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global active power (kilowatts)")
dev.copy(png, file = "plot1.png") 
dev.off() ## Close the PNG device!
