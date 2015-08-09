# plot2.R

df <- read.csv("household_power_consumption.txt", sep=";", na.strings="?")
df$DateTime <- strptime( paste(df$Date, df$Time), "%d/%m/%Y %X" )
df$Date <- as.Date(df$Date, "%d/%m/%Y")
df <- df[(df$Date == "2007-02-01") | (df$Date == "2007-02-02") | ((df$Date == "2007-02-03") & (format(df$DateTime, "%X") == "12:00:00 AM")),]

plot(df$Global_active_power
     , type="l"
     , ylab="Global Active Power (kilowatts)"
     , xaxt="n"
     , xlab=""
     )

atx <- format(df$DateTime, "%X") == "12:00:00 AM"

axis(1, at=which(atx), labels=c("Thu", "Fri", "Sat"))

dev.copy(device = png, filename="plot2.png", width=480, height=480)
dev.off()

#atx <- seq(starttime, endtime, by=7*24*60*60)
#axis(1, at=atx, labels=format(atx, "%b\n%d"), padj=0.5)
#c("Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat")[as.POSIXlt(df$Date)$wday + 1]