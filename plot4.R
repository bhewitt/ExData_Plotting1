#Read the data
x <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", 
                na.strings = "?")

#Set 1st column as date
x$Date <- as.Date(x$Date, format = "%d/%m/%Y")

#Subset dates
y <- x[(x$Date >= as.Date("2007-02-01") & x$Date < as.Date("2007-02-03")),]

#change parameters to make 2x2 plots
par(mfrow = c(2,2))

#Plot in PNG format
png(filename = "plot4.png", width = 480, height = 480, bg = NA)
par(mfrow = c(2,2))
with(y,{
        plot(Time,Global_active_power, type = "l", 
             xlab = NA, ylab = "Global Active Power")
        plot(Time, Voltage, type = "l", xlab = "datetime")
        plot(Time,Sub_metering_1, type = "l", xlab = NA, 
             ylab = "Energy sub metering")
        lines(Time,Sub_metering_2, col = "red")
        lines(Time,Sub_metering_3, col = "blue")
        legend("topright", bty = "n",c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), 
               lty = c(1,1,1), col = c("black", "red", "blue"))
        plot(Time, Global_reactive_power, type = "l", xlab = "datetime")
})
dev.off()