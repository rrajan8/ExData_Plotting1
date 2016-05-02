library(datasets)

plot3 <- function(){
  #Loading Data
  raw_data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
  data <- raw_data[as.Date(raw_data[,"Date"],"%d/%m/%Y") == as.Date("2007-02-01", "%Y-%m-%d") | as.Date(raw_data[,"Date"],"%d/%m/%Y") == as.Date("2007-02-02", "%Y-%m-%d"),]
  
  #plot
  png(filename='plot3.png',width=480,height=480,units='px')
  data$Date <- strptime(paste(data$Date,data$Time), "%d/%m/%Y %H:%M:%S")
  
  plot(data$Date, data$Sub_metering_1, type = "l",ylab="Energy sub metering",xlab="")
  lines(data$Date, data$Sub_metering_2, col = "Red")
  lines(data$Date, data$Sub_metering_3, col = "Blue")
  legend("topright", lty = 1, col = c("black","red", "blue"), legend = c("sub_metering_1", "sub_metering_2", "sub_metering_3"))
  
  dev.off()
  
}