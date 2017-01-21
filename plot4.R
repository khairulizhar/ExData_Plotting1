# Script Name: plot4.R

# Load library lubridate
library(lubridate)

# Source:household_power_consumption.txt
# using data from the dates 2007-02-01 and 2007-02-02.
df <- read.table("household_power_consumption.txt", sep = ";", skip = 66637, nrows = 2880)

# set column names to data
colnames(df) <- c("Date", "Time", "Global_active_power", "Global_reactive_power",
                  "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

# datetime - join date and time 
datetime <- dmy_hms(paste(df$Date, df$Time))

# globalActivePower - into numeric
globalActivePower <- as.numeric(df$Global_active_power)

# globalReactivePower - into numeric
globalReactivePower <- as.numeric(df$Global_reactive_power)

# Voltage - into numeric
voltage <- as.numeric(df$Voltage)

# subMetering1 - into numeric
subMetering1 <- as.numeric(df$Sub_metering_1)

# subMetering2 - into numeric
subMetering2 <- as.numeric(df$Sub_metering_2)

# subMetering3 - into numeric
subMetering3 <- as.numeric(df$Sub_metering_3)

# plot output format as PNG 
png("plot4.png", 480, 480)

# Apply plots into 2 rows by 2 column
par(mfrow=c(2,2))

# 1st plot
plot(datetime, globalActivePower, type="l", ylab="Global active power kilowatts")

# 2nd plot
plot(datetime, voltage, type="l", ylab="Voltage")

# 3rd Plot
plot(datetime, subMetering1, type="l", col="black", ylab="Energy sub metering")
points(datetime, subMetering2, type="l", col="red")
points(datetime, subMetering3, type="l", col="blue")

# Apply legendinto 3rd Plot 
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, 
       col=c("black", "red", "blue"))

# 4th Plot
plot(datetime, globalReactivePower, type="l", ylab="Global_reactive_power")

dev.off()
