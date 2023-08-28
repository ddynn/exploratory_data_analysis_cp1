# title: 'Exploratory Data Analysis: Course Project 1'
# author: "Yanan Dong"
# date: '2023-08-16'

# Plot 3
data_raw <- read.table("household_power_consumption.txt",header = T,sep=";") %>% 
data <- data_raw[data_raw$Date %in% c("1/2/2007","2/2/2007") ,]
  
#str(data)
data$datetime <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
data$sm1 <- as.numeric(data$Sub_metering_1)
data$sm2 <- as.numeric(data$Sub_metering_2)
data$sm3 <- as.numeric(data$Sub_metering_3)

## Plot 3
png(file="plot3.png", height=480, width=480)

plot(data$datetime, data$sm1, type="l", ylab="Energy Submetering", xlab="")
lines(data$datetime, data$sm2, type="l", col="red")
lines(data$datetime, data$sm3, type="l", col="blue")
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Saving to file
dev.off()
