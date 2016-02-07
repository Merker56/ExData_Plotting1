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
## Plot 1
png(file = "plot1.png", width = 480, height = 480)
hist(df$Global_active_power, col = "red", main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")
dev.off()