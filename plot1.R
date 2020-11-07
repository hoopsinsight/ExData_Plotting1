power <- read.delim("household_power_consumption.txt", header = TRUE, sep = ";")
# Convert date column to date class
power$Date <- as.Date(power$Date, "%d/%m/%Y")
# Convert time column to PosixLT
power$Time <- strptime(power$Time, format = "%H:%M:%S")
#Subset only needed dates
power2 <- subset(power, power$Date == "2007-02-01" | power$Date == "2007-02-02")
# Convert data columns to character values, then numeric
power2[,3:9] <- sapply(power2[,3:9], as.character)
power2[,3:9] <- sapply(power2[,3:9], as.numeric)
png("plot1.png")
with(power2, hist(Global_active_power, col = "red", main = "Global Active Power", xlab = "Global active power (in kilowatts)"))
dev.of()