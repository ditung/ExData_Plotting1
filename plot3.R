household <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")

# Coerce 'Date' to date format

library(dplyr)
household <- mutate(household, Date = as.Date(household$Date, format = "%d/%m/%Y"))

# Use only data from Feb 1-2, 2007

data <- subset(household, household$Date == "2007-02-01" | household$Date == "2007-02-02")

# Combine 'Date' and 'Time' into 'DateTime' variable

data$DateTime <- paste(data$Date, data$Time)
data$DateTime <- strptime(data$DateTime, format = "%Y-%m-%d %H:%M:%S")

# Print line plot "plot3" to png file

png(file = "plot3.png")
with(data, plot(DateTime, Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering"))

# Use Black, Red and Blue lines to represent Sub_metering 1, 2 and 3, respectively

lines(data$DateTime, data$Sub_metering_1, col = "Black")
lines(data$DateTime, data$Sub_metering_2, col = "Red")
lines(data$DateTime, data$Sub_metering_3, col = "Blue")

# Create legend in topright corner

legend("topright", col = c("Black", "Red", "Blue"), lty = 1, lwd = 1, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()