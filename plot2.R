# reading data file

file <- "household_power_consumption.txt"
data <- read.table(file, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")

# sub-setting data for required date

reqdata <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]


# histogram for plot2

datetime <- strptime(paste(reqdata$Date, reqdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
activepower <- as.numeric(reqdata$Global_active_power)
png("plot2.png")
plot(datetime, activepower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()