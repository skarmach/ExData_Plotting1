# --------------------------------------------------------
# This code plots a histogram of the Global-active-power
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

### histogram of Global Active Power
# plotted on screen
with(df, hist(Global_active_power,
              main = "Global Active Power",
              xlab = "Global Active Power (kilowatts)",
              ylab = "Frequency",
              col  = "orangered1"))

### plot to png
# open device
png(filename = "plot1.png")
# plot
with(df, hist(Global_active_power,
              main = "Global Active Power",
              xlab = "Global Active Power (kilowatts)",
              ylab = "Frequency",
              col  = "orangered1"))
# turn device off
dev.off()
