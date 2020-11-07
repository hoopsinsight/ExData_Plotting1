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
png("plot2.png")
plot(power2$datetime ,power2$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab ="" )
dev.off()