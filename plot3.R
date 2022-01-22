# reading data file

file <- "household_power_consumption.txt"
data <- read.table(file, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")

# sub-setting data for required date

reqdata <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

# histogram for plot3

#str(reqdata)
datetime <- strptime(paste(reqdata$Date, reqdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
activepower <- as.numeric(reqdata$Global_active_power)
subMetering1 <- as.numeric(reqdata$Sub_metering_1)
subMetering2 <- as.numeric(reqdata$Sub_metering_2)
subMetering3 <- as.numeric(reqdata$Sub_metering_3)

png("plot3.png")
plot(datetime, subMetering1, type="l", ylab="Energy sub metering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()