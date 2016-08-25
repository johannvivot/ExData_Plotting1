# Load file
f <- file("household_power_consumption.txt")

# Set colnames
cn <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

# Read only 2-days
hhpc <- read.table(text = grep("^[1,2]/2/2007", readLines(f), value = TRUE),  col.names = cn, sep = ";", header = TRUE)

# Open file
png(file="plot1.png", bg="transparent", width=480, height=480)

# Generate graph 1
hist(hhpc$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

# Plot
dev.off()