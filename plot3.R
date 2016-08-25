# Load file
f <- file("household_power_consumption.txt")

# Set colnames
cn <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

# Read only 2-days and add datetime column
hhpc <- read.table(text = grep("^[1,2]/2/2007", readLines(f), value = TRUE),  col.names = cn, sep = ";", header = TRUE)
hhpc$DateTime <- strptime(paste(hhpc$Date, hhpc$Time), format="%d/%m/%Y %H:%M:%S")

# Open file
png(file="plot3.png", bg="transparent", width=480, height=480)

# Generate graph 3
plot(hhpc$DateTime, hhpc$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
lines(hhpc$DateTime, hhpc$Sub_metering_2, col = "red")
lines(hhpc$DateTime, hhpc$Sub_metering_3, col = "blue")

legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Plot
dev.off()