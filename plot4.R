## Import file
dat <- read.table("household_power_consumption.txt", header = TRUE, sep=";")
## Subset data
df <- subset(dat, Date == "2/1/2007" | Date == "2/2/2007")
## Combine Date and Time
df$DT <- as.POSIXlt(paste(df$Date, df$Time, sep = " "), format = "%m/%d/%Y %H:%M:%S")
df$Date <- as.Date(df$Date, format = "%m/%d/%Y")
df$Global_active_power <- as.numeric(as.character(df$Global_active_power))
df$Global_reactive_power <- as.numeric(as.character(df$Global_reactive_power))
df$Voltage <- as.numeric(as.character(df$Voltage))
df$Global_intensity <- as.numeric(as.character(df$Global_intensity))
df$Sub_metering_1 <- as.numeric(as.character(df$Sub_metering_1))
df$Sub_metering_2 <- as.numeric(as.character(df$Sub_metering_2))
df$Sub_metering_3 <- as.numeric(as.character(df$Sub_metering_3))
## Plot 4
png(file= "plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2))
with(df, {
  plot(DT, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
  plot(DT, Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
  plot(df$DT, df$Sub_metering_1, type = "l", col = "blue", xlab = "", ylab = "Energy sub metering")
  points(df$DT, df$Sub_metering_1, type = "l", col = "black") 
  points(df$DT, df$Sub_metering_2, type = "l", col = "red")
  points(df$DT, df$Sub_metering_3, type = "l", col = "blue")
  legend("topright", pch = "-", col=c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(DT, Global_reactive_power, type = "l", xlab = "datetime")
})
dev.off()