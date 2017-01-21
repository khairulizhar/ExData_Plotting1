# Script Name: plot1.R

# Source: household_power_consumption.txt
# Use data from the dates 2007-02-01 and 2007-02-02.
df <- read.table("household_power_consumption.txt", sep = ";", skip = 66637, nrows = 2880)

# set column names to data
colnames(df) <- c("Date", "Time", "Global_active_power", "Global_reactive_power",
                  "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")


# apply grdevices with size
png("plot1.png", 480, 480)

# Evaluate expresion apply with histograms
with(df, hist(Global_active_power, col="red", xlab="Global active power (kilowatts)",
              main="Global Active Power"))

dev.off()