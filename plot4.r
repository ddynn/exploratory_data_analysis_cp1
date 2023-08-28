# title: 'Exploratory Data Analysis: Course Project 1'
# author: "Yanan Dong"
# date: '2023-08-16'

#Import and subset the power consumption data
data_raw <- read.table("household_power_consumption.txt",header = T,sep=";") %>% 
data <- data_raw[data_raw$Date %in% c("1/2/2007","2/2/2007") ,]
  
#str(data)
data$data$datetime <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
data$sm1 <- as.numeric(data$Sub_metering_1)
data$sm2 <- as.numeric(data$Sub_metering_2)
data$sm3 <- as.numeric(data$Sub_metering_3)
data$gap <- as.numeric(data$Global_active_power)
data$grp<- as.numeric(data$Global_reactive_power)
data$voltage <- as.numeric(data$Voltage)


#Plot 4
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

#p4.1
plot(data$datetime, data$gap, type="l", xlab="", ylab="Global Active Power", cex=0.2)

#p4.2
plot(data$datetime, data$voltage, type="l", xlab="datetime", ylab="Voltage")

#p4.3
plot(data$datetime, data$sm1, type="l", ylab="Energy Submetering", xlab="")
lines(data$datetime, data$sm2, type="l", col="red")
lines(data$datetime, data$sm3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

#p4.4
plot(data$datetime, data$grp, type="l", xlab="datetime", ylab="Global_reactive_power")

## Saving to file
dev.off()
