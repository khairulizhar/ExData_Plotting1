# Script Name: plot3.R

# load lubridate library
library(lubridate)

# Source: household_power_consumption.txt
# Use data from the dates 2007-02-01 and 2007-02-02.
df <- read.table("household_power_consumption.txt", sep = ";", skip = 66637, nrows = 2880)

# set column names of data
colnames(df) <- c("Date", "Time", "Global_active_power", "Global_reactive_power",
                  "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

# datetime - join date and time 
datetime <- dmy_hms(paste(df$Date, df$Time))

# subMetering1 - into numeric
subMetering1 <- as.numeric(df$Sub_metering_1)

# subMetering2 - into numeric
subMetering2 <- as.numeric(df$Sub_metering_2)

# subMetering3 - into numeric
subMetering3 <- as.numeric(df$Sub_metering_3)

# apply grdevices with size
png("plot3.png", 480, 480)

plot(datetime, subMetering1, type="l", col="black", ylab="Energy sub metering")
points(datetime, subMetering2, type="l", col="red")
points(datetime, subMetering3, type="l", col="blue")

# add legends to plot
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, 
       col=c("black", "red", "blue"))

dev.off()
