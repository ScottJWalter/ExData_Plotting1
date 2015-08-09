# plot4.R

df <- read.csv("household_power_consumption.txt", sep=";", na.strings="?")
df$DateTime <- strptime( paste(df$Date, df$Time), "%d/%m/%Y %X" )
df$Date <- as.Date(df$Date, "%d/%m/%Y")
df <- df[(df$Date == "2007-02-01") | (df$Date == "2007-02-02") | ((df$Date == "2007-02-03") & (format(df$DateTime, "%X") == "12:00:00 AM")),]

atx <- format(df$DateTime, "%X") == "12:00:00 AM"


par(mfcol = c(2, 2))

# Plot 1 - from plot2.R
plot(df$Global_active_power
     , type="l"
     , ylab="Global Active Power (kilowatts)"
     , xaxt="n"
     , xlab=""
)

axis(1, at=which(atx), labels=c("Thu", "Fri", "Sat"))

# Plot 2 - from plot3.R
plot(df$Sub_metering_1, type="l", ylab="Energy sub metering", xaxt="n", xlab="")
lines(df$Sub_metering_2, col="red" )
lines(df$Sub_metering_3, col="blue")

axis(1, at=which(atx), labels=c("Thu", "Fri", "Sat"))

legend("topright"
       , legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
       , col=c("black", "red", "blue")
       , lwd=1
       , bty="n"
)

# Plot 3
plot(df$Voltage
     , type="l"
     , ylab="Voltage"
     , xaxt="n"
     , xlab="datetime"
     )

axis(1, at=which(atx), labels=c("Thu", "Fri", "Sat"))

# Plot 4
plot(df$Global_reactive_power
     , type="l"
     , ylab="Global_reactive_power"
     , xaxt="n"
     , xlab="datetime"
     , xaxp=c(0.0, 0.5, 5)
     , cex.axis=0.6
     )
axis(1, at=which(atx), labels=c("Thu", "Fri", "Sat"))

# Save

dev.copy(device = png, filename="plot4.png", width=480, height=480)
dev.off()

