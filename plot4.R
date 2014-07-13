
plot3 <- function(){
  
  dataFile <- "household_power_consumption.txt"
  data <- read.table( dataFile, header=TRUE, sep=";", colClasses=c("character", "character", rep("numeric",7)), na="?" )
  
  data$Time <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
  
  data$Date <- as.Date( data$Date, "%d/%m/%Y" )
  
  datesConsidered <- as.Date( c("2007-02-01", "2007-02-02"), "%Y-%m-%d" )
  
  dataConsidered <- subset( data, Date %in% datesConsidered )
  
  # create a PNG file with a width of 480 pixels and a height of 480 pixels
  png("plot4.png", width=480, height=480)
  
  par(mfrow=c(2,2))
  
  ## Global Active Power: plot at 1st row and 1st column
  plot( dataConsidered$Time, dataConsidered$Global_active_power,
        main = "",        
        xlab = "",
        ylab = "Global Active Power",
        type = "l")  
  
  ## Voltage  : plot at 1st row and 1st column
  plot( dataConsidered$Time, dataConsidered$Voltage,
        main = "",        
        xlab = "datetime",
        ylab = "Voltage",
        type = "l")  
  
  ## Energy sub metering: plot at 2nd row and 1st column
  plot( dataConsidered$Time, dataConsidered$Sub_metering_1,
        main = "",        
        xlab = "",
        ylab = "Energy sub metering",
        type = "l",
        col  ="black") 
  
  
  lines( dataConsidered$Time, dataConsidered$Sub_metering_2, col  ="red")
  
  
  lines( dataConsidered$Time, dataConsidered$Sub_metering_3, col  ="blue")
  
  
  legend("topright",
         col = c("black", "red", "blue"),
         c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
         lty = c(1,1,1),
         lwd = c(2.5,2.5),
         box.lwd = 0)
  
  ## global_reactive_power: plot at 2nd row and 2nd column
  plot( dataConsidered$Time, dataConsidered$Global_reactive_power,
        main = "",        
        xlab = "datetime",
        ylab = "Global_reactive_power",
        type = "l") 
  
  dev.off()
}
