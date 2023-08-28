# title: 'Exploratory Data Analysis: Course Project 1'
# author: "Yanan Dong"
# date: '2023-08-16'

#Import and subset the power consumption data
data_raw <- read.table("household_power_consumption.txt",header = T,sep=";") 

data<-data_raw[data_raw$Date %in% c("1/2/2007","2/2/2007") ,] 

data$Global_active_power<-as.numeric(data$Global_active_power) 
data$datetime<-strptime(paste(data$Date,data$Time, sep = " "), format="%d/%m/%Y %H:%M:%S")


## Plot 2
png(file="plot2.png", height=480, width=480)
plot(data$datetime,data$Global_active_power, type="l",xlab="",ylab="Global Active Power (kilowatts)") 
dev.off()
