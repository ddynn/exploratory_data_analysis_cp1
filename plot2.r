# title: 'Exploratory Data Analysis: Course Project 1'
# author: "Yanan Dong"
# date: '2023-08-16'

# Plot 2

library(dplyr)

#Import and subset the power consumption data
data_raw <- read.table("household_power_consumption.txt",header = T,sep=";") %>% 
  mutate(Date=as.Date(Date, format = "%d/%m/%Y"))

data<-data_raw %>% filter(Date >= "2007-02-01" & Date <= "2007-02-02") %>% 
  mutate(Global_active_power = as.numeric(Global_active_power),
         datetime = as.POSIXct(paste(as.Date(Date), Time)))


## Plot 2
png(file="plot2.png", height=480, width=480)
plot(data$datetime,data$Global_active_power, xaxt = "n", type="l",xlab="",ylab="Global Active Power (kilowatts)") 
dev.off()
