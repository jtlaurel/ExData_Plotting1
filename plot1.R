powercon <- read.table(file="household_power_consumption.txt", header=T, sep=";")
powercon$Date <- as.Date(powercon$Date, format="%d/%m/%Y")
powerconsub <- subset(powercon, Date >= "2007-02-01" & Date <= "2007-02-02")
powerconsub$Time <- paste(powerconsub$Date, powerconsub$Time, sep =" ")
powerconsub$Time <- ymd_hms(powerconsub$Time)

png(file = "./plot1.png", width=480, height=480)
hist(as.numeric(powerconsub$Global_active_power),col = "red",main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()
