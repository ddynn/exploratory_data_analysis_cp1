# title: 'Exploratory Data Analysis: Course Project 1'
# author: "Yanan Dong"
# date: '2023-08-16'

# Plot 3

library(dplyr)

#Import and subset the power consumption data
data_raw <- read.table("household_power_consumption.txt",header = T,sep=";") %>% 
  mutate(Date=as.Date(Date, format = "%d/%m/%Y"))

data<-data_raw %>% filter(Date >= "2007-02-01" & Date <= "2007-02-02") %>% 
  mutate(Global_active_power = as.numeric(Global_active_power),
         datetime = as.POSIXct(paste(as.Date(Date), Time)))

## Plot 3
png(file="plot3.png", height=480, width=480)

with(data, {
  plot(Sub_metering_1~datetime, type="l",
       ylab="Energy sub-metering", xlab="", xaxt = "n")
  lines(Sub_metering_2~datetime,col='Red')
  lines(Sub_metering_3~datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Saving to file
dev.off()
