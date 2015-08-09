# plot1.R

df <- read.csv("household_power_consumption.txt", sep=";", na.strings="?")
# df$Time <- strptime(paste(df$Date, df$Time), "%d/%m/%Y %X")
df$Date <- as.Date(df$Date, "%d/%m/%Y")
df <- df[(df$Date == "2007-02-01") | (df$Date == "2007-02-02"),]

hist(df$Global_active_power,
     breaks = 12,
     col = "red",
     ylim=c(0, 1200),
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency")

dev.copy(device = png, filename="plot1.png", width=480, height=480)
dev.off()
