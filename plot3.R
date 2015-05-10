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
png(file = "plot3.png")
subm1 <- data$Sub_metering_1
subm2 <- data$Sub_metering_2
subm3 <- data$Sub_metering_3

plot(subm1, type="l", col="black",
     xaxt="n", ylab="Energy sub metering", xlab="")
axis(1, at=c(0, length(gap)/2, length(gap)), labels=c("Thur", "Fri", "Sat"))
lines(subm2, col="red")
lines(subm3,col="blue")
legend("topright", cex=0.8, pt.cex = 1,
       lwd=1, col=c("black", "red", "blue"),
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()

