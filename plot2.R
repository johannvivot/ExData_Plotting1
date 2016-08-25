# Load file
f <- file("household_power_consumption.txt")

# Set colnames
cn <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

# Read only 2-days and add datetime column
hhpc <- read.table(text = grep("^[1,2]/2/2007", readLines(f), value = TRUE),  col.names = cn, sep = ";", header = TRUE)
hhpc$DateTime <- strptime(paste(hhpc$Date, hhpc$Time), format="%d/%m/%Y %H:%M:%S")

# Open file
png(file="plot2.png", bg="transparent", width=480, height=480)

# Generate graph 2
plot(hhpc$DateTime, hhpc$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")

# Plot
dev.off()