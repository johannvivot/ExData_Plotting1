# Load file
f <- file("household_power_consumption.txt")

# Set colnames
cn <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

# Read only 2-days and add datetime column
hhpc <- read.table(text = grep("^[1,2]/2/2007", readLines(f), value = TRUE),  col.names = cn, sep = ";", header = TRUE)
hhpc$DateTime <- strptime(paste(hhpc$Date, hhpc$Time), format="%d/%m/%Y %H:%M:%S")

# Open file
png(file="plot4.png", bg="transparent", width=480, height=480)

# Generate graph 3
par(mfrow = c(2,2), mar = c(4,4,2,1), oma = c(0,0,2,0))

# 1
plot(hhpc$DateTime, hhpc$Global_active_power, type = "l", ylab = "Global Active Power", xlab = "")

# 2
plot(hhpc$DateTime, hhpc$Voltage, type = "l", ylab = "Voltage", xlab = "datetime")

# 3
plot(hhpc$DateTime, hhpc$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
lines(hhpc$DateTime, hhpc$Sub_metering_2, col = "red")
lines(hhpc$DateTime, hhpc$Sub_metering_3, col = "blue")
legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, bty = "n", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# 4
plot(hhpc$DateTime, hhpc$Global_reactive_power, type = "l", ylab = "Global_rective_power", xlab = "datetime")

# Plot
dev.off()