#Read the data
x <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", 
                na.strings = "?")

#Set 1st column as date
x$Date <- as.Date(x$Date, format = "%d/%m/%Y")

#Subset dates
y <- x[(x$Date >= as.Date("2007-02-01") & x$Date < as.Date("2007-02-03")),]

#Set column "Time" as date and time
y$Time <- as.POSIXct(paste(y$Date, y$Time), format="%Y-%m-%d %H:%M:%S")

#Plot in PNG format
png(filename = "plot3.png", width = 480, height = 480, bg = NA)
with(y, 
     {plot(Time,Sub_metering_1, type = "l", xlab = NA, 
             ylab = "Energy sub metering")
        lines(Time,Sub_metering_2, col = "red")
        lines(Time,Sub_metering_3, col = "blue")
        legend("topright", c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), 
               lty = c(1,1,1), col = c("black", "red", "blue"))
})
dev.off()