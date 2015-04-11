## Read in Data from working directory
data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)

## Subset data to include only 2007-2-1 AND 2007-2-2
Day1 <- subset(data, data$Date == "1/2/2007")
Day2 <- subset(data, data$Date == "2/2/2007")
new.data <- rbind(Day1, Day2)

## Coerce Global_active_power to a numeric vector
new.data$Global_active_power <- as.numeric(as.character(new.data$Global_active_power))

## Create file to save png version of the plot into
mypath <- file.path("~", "/Desktop", "Coursera", paste("plot1", ".png", sep = ""))
png(file=mypath)

## Plot a histogram of Global_active_power for the subset data
hist(new.data$Global_active_power, ylim = c(0, 1200), xaxt = "n", 
     main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")
axis(1, at = c(0, 2, 4, 6), tck= -.01)

## Turn off the graphics device
dev.off()






