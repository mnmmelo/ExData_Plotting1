## Read data - subset after loading data
data.name <- "household_power_consumption.txt"

data <- read.csv(data.name,
                  sep=";",
                  na.strings="?",
                  colClasses = c("character", "character", "numeric",
                                 "numeric", "numeric", "numeric",
                                 "numeric", "numeric", "numeric"))
data$Date <- strptime(data$Date, format = "%d/%m/%Y")
data$Date <- as.Date(data$Date)
data <- subset(data, data$Date == "2007-02-01" | data$Date == "2007-02-02")
data$datetime <- as.POSIXct(paste(data$Date, data$Time))

## Create png plot
png(file = "plot1.png")
gap <- data$Global_active_power

hist(gap, col="red",
     main="Global Active Power", xlab="GlobalActive Power (Kilowatts)")

dev.off()
