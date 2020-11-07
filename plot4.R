power <- read.delim("household_power_consumption.txt", header = TRUE, sep = ";")
# create datetime column by concatenating date and time, then converting it
power$datetime <- paste(power$Date, power$Time)
power$datetime <- strptime(power$datetime, format = "%d/%m/%Y %H:%M:%S")
# Convert date column to date class
power$Date <- as.Date(power$Date, "%d/%m/%Y")
# Convert time column to PosixLT
power$Time <- strptime(power$Time, format = "%H:%M:%S")
#Subset only needed dates
power2 <- subset(power, power$Date == "2007-02-01" | power$Date == "2007-02-02")
# Convert data columns to character values, then numeric
power2[,3:9] <- sapply(power2[,3:9], as.character)
power2[,3:9] <- sapply(power2[,3:9], as.numeric)
png("plot4.png")
par(mfcol = c(2,2), mar = c(6,4,2,2))
plot(power2$datetime ,power2$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab ="" )
plot(power2$datetime ,power2$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab ="" )
lines(power2$datetime, power2$Sub_metering_2, type = "l", col = "red")
lines(power2$datetime, power2$Sub_metering_3, type = "l", col = "blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),col=c("black","red", "blue"), lty= 1)
with(power2, plot(datetime, Voltage, type ="l"))
with(power2, plot(datetime, Global_reactive_power, type ="l"))
dev.off()