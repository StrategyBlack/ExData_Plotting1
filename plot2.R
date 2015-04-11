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

## Create file to save png version of the plot into
mypath <- file.path("~", "/Desktop", "Coursera", paste("plot2", ".png", sep = ""))
png(file=mypath)

## Plot Global_active_power by date_time
plot(new.data$date_time, new.data$Global_active_power, type = "l", 
     ylab = "Global Active Power (kilowatts)", xlab = "")

## Turn off the graphics device
dev.off()