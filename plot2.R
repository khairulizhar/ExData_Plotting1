# Script Name: plot2.R

# Load lubridate library
library(lubridate)

# Source: household_power_consumption.txt
# Use data from the dates 2007-02-01 and 2007-02-02.
df <- read.table("household_power_consumption.txt", sep = ";", skip = 66637, nrows = 2880)

# set column names of data
colnames(df) <- c("Date", "Time", "Global_active_power", "Global_reactive_power",
                  "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

# datetime - join date and time 
datetime <- dmy_hms(paste(df$Date, df$Time))


globalActivePower <- df$Global_active_power

# apply grdevices with size
png("plot2.png", 480, 480)

# apply plot
plot(datetime, as.numeric(globalActivePower), type="l", ylab="Global active power kilowatts")

dev.off()

