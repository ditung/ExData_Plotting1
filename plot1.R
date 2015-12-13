household <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")

# Coerce dates to date format

library(dplyr)
household <- mutate(household, Date = as.Date(household$Date, format = "%d/%m/%Y"))

# Use only data from Feb 1-2, 2007

data <- subset(household, household$Date == "2007-02-01" | household$Date == "2007-02-02")

# Print histogram "plot1" to png file

png(file = "plot1.png")
hist(data$Global_active_power, xlab = "Global Active Power (kilowatts)", main = "Global Active Power", col = "red")
dev.off()