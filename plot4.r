# title: 'Exploratory data Analysis: Course Project 1'
# author: "Yanan Dong"
# date: '2023-08-16'

# Plot 4

library(dplyr)

#Import and subset the power consumption data
data_raw <- read.table("household_power_consumption.txt",header = T,sep=";") %>% 
  mutate(date=as.date(date, format = "%d/%m/%Y"))

data<-data_raw %>% filter(date >= "2007-02-01" & date <= "2007-02-02") %>% 
  mutate(Global_active_power = as.numeric(Global_active_power),
         datetime = as.POSIXct(paste(as.date(date), Time)))

## Plot 4
png(file="plot4.png", height=480, width=480)

par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(data, {
  plot(Global_active_power~datetime, type="l", 
       ylab="Global Active Power", xlab="")
  plot(Voltage~datetime, type="l", 
       ylab="Voltage", xlab="")
  plot(Sub_metering_1~datetime, type="l", 
       ylab="Global Active Power  ", xlab="")
  lines(Sub_metering_2~datetime,col='Red')
  lines(Sub_metering_3~datetime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power~datetime, type="l", 
       ylab="Global Rective Power  ",xlab="")
})

## Saving to file
dev.off()
