# title: 'Exploratory Data Analysis: Course Project 1'
# author: "Yanan Dong"
# date: '2023-08-16'

# Plot 1

library(dplyr)
#Import and subset the power consumption data
data <- read.table("household_power_consumption.txt",header = T,sep=";")
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data<-data %>% filter(Date >= "2007-02-01" & Date <= "2007-02-02")

# create plot
# Save it to a PNG file with a width of 480 pixels and a height of 480 pixels.

png(file="plot1.png", height=480, width=480)
hist(as.numeric(data$Global_active_power), main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red") 

dev.off()
