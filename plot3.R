# plot3.R

df <- read.csv("household_power_consumption.txt", sep=";", na.strings="?")
df$DateTime <- strptime( paste(df$Date, df$Time), "%d/%m/%Y %X" )
df$Date <- as.Date(df$Date, "%d/%m/%Y")
df <- df[(df$Date == "2007-02-01") | (df$Date == "2007-02-02") | ((df$Date == "2007-02-03") & (format(df$DateTime, "%X") == "12:00:00 AM")),]

plot(df$Sub_metering_1, type="l", ylab="Energy sub metering", xaxt="n", xlab="")
lines(df$Sub_metering_2, col="red" )
lines(df$Sub_metering_3, col="blue")

atx <- format(df$DateTime, "%X") == "12:00:00 AM"

axis(1, at=which(atx), labels=c("Thu", "Fri", "Sat"))

legend("topright"
       , legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
       , col=c("black", "red", "blue")
       , lwd=1
       )

dev.copy(device = png, filename="plot3.png", width=480, height=480)
dev.off()
