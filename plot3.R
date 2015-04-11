## Read in data
data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)

## Subset data to include only 2007-2-1 AND 2007-2-2
Day1 <- subset(data, data$Date == "1/2/2007")
Day2 <- subset(data, data$Date == "2/2/2007")
new.data <- rbind(Day1, Day2)

## Create new variable combining Date and Time into date_time
new.data$date_time <- paste(new.data$Date, new.data$Time, sep = ",")

## Coerce date_time into a POSIXct vector
new.data$date_time <- strptime(new.data$date_time, format = "%d/%m/%Y,%H:%M:%S")
new.data$date_time <- as.POSIXct(new.data$date_time, format = "%d/%m/%Y,%H:%M:%S")

## Coerce Sub_metering_1, 2 and 3 variables to a numeric vectors
new.data$Sub_metering_1 <- as.numeric(as.character(new.data$Sub_metering_1))
new.data$Sub_metering_2 <- as.numeric(as.character(new.data$Sub_metering_2))
new.data$Sub_metering_3 <- as.numeric(as.character(new.data$Sub_metering_3))

## Create file to save png version of the plot into
mypath <- file.path("~", "/Desktop", "Coursera", paste("plot3", ".png", sep = ""))
png(file=mypath)

## Plot comparison of Sub_metering_1, Sub_metering_2, and Sub_metering_3
plot(new.data$date_time, new.data$Sub_metering_1, type = "l", ylab = "Energy sub metering",
     xlab = "")
lines(new.data$date_time, new.data$Sub_metering_2, type = "l", col = "red")
lines(new.data$date_time, new.data$Sub_metering_3, type = "l", col = "blue")
legend("topright", lty = c(1, 1, 1), col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Turn off the graphics device
dev.off()

