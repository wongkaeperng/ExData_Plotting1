#Load Data 
loadPowerData <- function() {
      data <- read.table("household_power_consumption.txt",
                         header=TRUE,
                         sep=";",
                         colClasses=c("character", "character", rep("numeric",7)),
                         na="?")
      
      #Convert time variable
      data$Time <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
      
      # Convert date variable
      data$Date <- as.Date(data$Date, "%d/%m/%Y")
      
      # Extract data with 2 dates
      dates <- as.Date(c("2007-02-01", "2007-02-02"), "%Y-%m-%d")
      data <- subset(data, Date %in% dates)
      
      return(data)
}

plot2 <- function(data=NULL) {
      data <- loadPowerData()
      
      png("plot2.png", width=600, height=600)
      
      plot(data$Time, data$Global_active_power,
           type="l",
           xlab="",
           ylab="Global Active Power (kilowatts)")
      
      dev.off()
}