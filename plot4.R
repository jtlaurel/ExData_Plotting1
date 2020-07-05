##This function will create a plot with 4 subplots containing the following:
##1. A plot of Global Active Power as a function of datetime
##2. A plot of Voltage as a function of datetime
##3. A plot of of all Sub metering categories as a function of datetime
##4. A plot of Global Reactive Power as a function of datetime

##Load lubridate library
library(lubridate)

##Read data
powercon <- read.table(file="household_power_consumption.txt", header=T, sep=";")

##Convert Date to Date format and subset the desired dates
powercon$Date <- as.Date(powercon$Date, format="%d/%m/%Y")
powerconsub <- subset(powercon, Date >= "2007-02-01" & Date <= "2007-02-02")

##Convert Time to usable Time format by concatenating Date & Time
powerconsub$Time <- paste(powerconsub$Date, powerconsub$Time, sep =" ")
powerconsub$Time <- ymd_hms(powerconsub$Time)

##Save histogram as a PNG
png(file = "./plot4.png", width=480, height=480)
par(mfrow=c(2,2))
plot(powerconsub$Time, as.numeric(powerconsub$Global_active_power), xlab = " ", ylab = "Global Active Power", type = 'l')
plot(powerconsub$Time, as.numeric(powerconsub$Voltage), xlab = "datetime", ylab = "Voltage", type = 'l')
plot(powerconsub$Time, as.numeric(powerconsub$Sub_metering_1), xlab = " ", ylab = "Energy sub metering", type = 'l')
points(powerconsub$Time, as.numeric(powerconsub$Sub_metering_2), col = "red", type = 'l')
points(powerconsub$Time, as.numeric(powerconsub$Sub_metering_3), col = "blue", type = 'l')
legend("topright", legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), lty=1, bty = "n", col = c("black", "red", "blue"), cex =0.9)
plot(powerconsub$Time, as.numeric(powerconsub$Global_reactive_power), xlab = "datetime", ylab = "Global_Reactive_Power", type = 'l')
dev.off()