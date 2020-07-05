##This function will plot Global Active Power as a function of datetime".

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
png(file = "./plot2.png", width=480, height=480)
plot(powerconsub$Time, as.numeric(powerconsub$Global_active_power), xlab = " ", ylab = "Global Active Power (kilowatts)", type = 'l')
dev.off()