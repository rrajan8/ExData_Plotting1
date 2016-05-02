library(datasets)

plot1 <- function(){
  #Loading Data
  raw_data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
  data <- raw_data[as.Date(raw_data[,"Date"],"%d/%m/%Y") == as.Date("2007-02-01", "%Y-%m-%d") | as.Date(raw_data[,"Date"],"%d/%m/%Y") == as.Date("2007-02-02", "%Y-%m-%d"),]
  
  #plot the data
  png(filename='plot1.png',width=480,height=480,units='px')
  hist(data$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
  dev.off()
}
