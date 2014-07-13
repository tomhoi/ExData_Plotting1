
plot1 <- function(){
  
  dataFile <- "household_power_consumption.txt"
  data <- read.table( dataFile, header=TRUE, sep=";", colClasses=c("character", "character", rep("numeric",7)), na="?" )
  
  data$Date <- as.Date( data$Date, "%d/%m/%Y" )
  
  datesConsidered <- as.Date( c("2007-02-01", "2007-02-02"), "%Y-%m-%d" )
  
  dataConsidered <- subset( data, Date %in% datesConsidered )

  # create a PNG file with a width of 480 pixels and a height of 480 pixels
  png("plot1.png", width=480, height=480)

  hist( dataConsidered$Global_active_power,
        main = "Global Active Power",
        xlab = "Global Active Power (kilowatts)",
        ylab = "Frequency",
        col  = "red")

  dev.off()
}
