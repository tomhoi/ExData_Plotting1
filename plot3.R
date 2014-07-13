
plot3 <- function(){
  
  dataFile <- "household_power_consumption.txt"
  data <- read.table( dataFile, header=TRUE, sep=";", colClasses=c("character", "character", rep("numeric",7)), na="?" )
  
  data$Time <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
  
  data$Date <- as.Date( data$Date, "%d/%m/%Y" )
  
  datesConsidered <- as.Date( c("2007-02-01", "2007-02-02"), "%Y-%m-%d" )
  
  dataConsidered <- subset( data, Date %in% datesConsidered )
  
  # create a PNG file with a width of 480 pixels and a height of 480 pixels
  png("plot3.png", width=480, height=480)
  
  plot( dataConsidered$Time, dataConsidered$Sub_metering_1,
        main = "",        
        xlab = "",
        ylab = "Energy sub metering",
        type = "l",
        col  ="black") 
  
  
  lines( dataConsidered$Time, dataConsidered$Sub_metering_2, col  ="red")
  
  
  lines( dataConsidered$Time, dataConsidered$Sub_metering_3, col  ="blue")
  
  
  legend("topright",
         col=c("black", "red", "blue"),
         c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
         lty=c(1,1,1),
         lwd=c(2.5,2.5))
  
  dev.off()
}
