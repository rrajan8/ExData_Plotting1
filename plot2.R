library(datasets)

plot2 <- function(){
  #Loading Data
  raw_data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
  data <- raw_data[as.Date(raw_data[,"Date"],"%d/%m/%Y") == as.Date("2007-02-01", "%Y-%m-%d") | as.Date(raw_data[,"Date"],"%d/%m/%Y") == as.Date("2007-02-02", "%Y-%m-%d"),]

  #plot
  png(filename='plot2.png',width=480,height=480,units='px')
  data$Date <- strptime(paste(data$Date,data$Time), "%d/%m/%Y %H:%M:%S")
  plot(data$Date, data$Global_active_power, type = "l",ylab="Global Active Power (kilowatts)",xlab="")
  
  dev.off()
  
}