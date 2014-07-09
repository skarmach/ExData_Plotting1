# --------------------------------------------------------
# This code plots a multi-frame timeseries of 4 variables
# for days 2007-02-01 and 2007-02-02
# --------------------------------------------------------

### read household power consumption data into a dataframe
# it is semicolon delimited
df <- read.table("./household_power_consumption.txt",
                 header = TRUE,
                 sep = ";",
                 na.strings = "?")

### keeping only the required data to save resources
# only 2007-02-01 and 2007-02-02 are required
df <- df[df$Date == "1/2/2007" | df$Date == "2/2/2007", ]

### converting date and time strings to datetime
df$DateTime <- strptime(paste(df$Date, df$Time), format="%d/%m/%Y %H:%M:%S")

### we don't need the date and time string anymore
df <- df[, c(-1:-2)]

### initialize the multi-frame canvas
par(mfcol = c(2, 2))

### timeseries of Global Active Power
# plotted on screen
with(df, plot(DateTime,
              Global_active_power,
              xlab = "",
              ylab = "Global Active Power",
              type = "l"))

### timeseries of Energy sub metering
# plotted on screen
with(df, plot(DateTime,
              Sub_metering_1,
              xlab = "",
              ylab = "Energy sub metering",
              type = "l",
              col  = "black"))
with(df, lines(DateTime,
               Sub_metering_2,
               col  = "red"))
with(df, lines(DateTime,
               Sub_metering_3,
               col  = "blue"))
legend("topright",
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       cex = 0.9,
       col = c("black", "red", "blue"),
       lty = 1,
       bty = "n")

### timeseries of Global Active Power
# plotted on screen
with(df, plot(DateTime,
              Voltage,
              xlab = "datetime",
              ylab = "Voltage",
              type = "l"))

### timeseries of Global Active Power
# plotted on screen
with(df, plot(DateTime,
              Global_reactive_power,
              xlab = "datetime",
              ylab = "Global_reactive_power",
              type = "l"))

### reset multiframe to single frame
par(mfcol = c(1, 1))

### plot to png
# open device
png(filename = "plot4.png")
# plot
par(mfcol = c(2, 2))

### timeseries of Global Active Power
# plotted on screen
with(df, plot(DateTime,
              Global_active_power,
              xlab = "",
              ylab = "Global Active Power",
              type = "l"))

### timeseries of Energy sub metering
# plotted on screen
with(df, plot(DateTime,
              Sub_metering_1,
              xlab = "",
              ylab = "Energy sub metering",
              type = "l",
              col  = "black"))
with(df, lines(DateTime,
               Sub_metering_2,
               col  = "red"))
with(df, lines(DateTime,
               Sub_metering_3,
               col  = "blue"))
legend("topright",
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       cex = 0.9,
       col = c("black", "red", "blue"),
       lty = 1,
       bty = "n")

### timeseries of Global Active Power
# plotted on screen
with(df, plot(DateTime,
              Voltage,
              xlab = "datetime",
              ylab = "Voltage",
              type = "l"))

### timeseries of Global Active Power
# plotted on screen
with(df, plot(DateTime,
              Global_reactive_power,
              xlab = "datetime",
              ylab = "Global_reactive_power",
              type = "l"))

### reset multiframe to single frame
par(mfcol = c(1, 1))
# turn device off
dev.off()
