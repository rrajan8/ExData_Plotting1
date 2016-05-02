library(datasets)

plot4 <- function(){
  #Loading Data
  raw_data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
  data <- raw_data[as.Date(raw_data[,"Date"],"%d/%m/%Y") == as.Date("2007-02-01", "%Y-%m-%d") | as.Date(raw_data[,"Date"],"%d/%m/%Y") == as.Date("2007-02-02", "%Y-%m-%d"),]
  
  
  
  #plot
  data$Date <- strptime(paste(data$Date,data$Time), "%d/%m/%Y %H:%M:%S")
  png(filename='plot4.png',width=480,height=480,units='px')
  par(mfrow = c(2,2))
  #top right
  plot(data$Date, data$Global_active_power, type = "l", ylab = "Global Active Power", xlab = "")
  #top left
  plot(data$Date, data$Voltage, type = "l", ylab = "Voltage", xlab = "datetime")
  
  #bottom right
  plot(data$Date, data$Sub_metering_1, type = "l",ylab="Energy sub metering",xlab="")
  lines(data$Date, data$Sub_metering_2, col = "Red")
  lines(data$Date, data$Sub_metering_3, col = "Blue")
  legend("topright", lty = 1, col = c("black","red", "blue"), legend = c("sub_metering_1", "sub_metering_2", "sub_metering_3"), bty = "n")
  
  #bottom left
  plot(data$Date, data$Global_reactive_power,type = "l", ylab = "Global_reactive_power", xlab = "datetime")
  dev.off()
  
}