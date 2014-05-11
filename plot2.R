#Read the data
x <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", 
                na.strings = "?")

#Set 1st column as date
x$Date <- as.Date(x$Date, format = "%d/%m/%Y")

#Subset dates
y <- x[(x$Date >= as.Date("2007-02-01") & x$Date < as.Date("2007-02-03")),]
y$Time <- as.POSIXct(paste(y$Date, y$Time), format="%Y-%m-%d %H:%M:%S")

#Create plot in PNG format
png(filename = "plot2.png", width = 480, height = 480, bg = NA)
with(y, plot(Time,Global_active_power, type = "l", 
     xlab = NA, ylab = "Global Active Power (kilowatts)"))
dev.off()