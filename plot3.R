##This function will plot all 3 Sub metering categories as a function of datetime.

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
png(file = "./plot3.png", width=480, height=480)
plot(powerconsub$Time, as.numeric(powerconsub$Sub_metering_1), xlab = " ", ylab = "Energy sub metering", type = 'l')
points(powerconsub$Time, as.numeric(powerconsub$Sub_metering_2), col = "red", type = 'l')
points(powerconsub$Time, as.numeric(powerconsub$Sub_metering_3), col = "blue", type = 'l')
legend("topright", legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), lty=1, col = c("black", "red", "blue"))
dev.off()