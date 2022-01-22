# reading data file

file <- "household_power_consumption.txt"
data <- read.table(file, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")

# sub-setting data for required date

reqdata <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

# histogram for plot1

activepower <- as.numeric(reqdata$Global_active_power)
png("plot1.png")
hist(activepower, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()