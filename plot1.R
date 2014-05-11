#Read the data
x <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", 
                na.strings = "?")

#Set 1st column as date
x$Date <- as.Date(x$Date, format = "%d/%m/%Y")

#Subset dates
y <- x[(x$Date >= as.Date("2007-02-01") & x$Date < as.Date("2007-02-03")),]

#Plot in PNG format
png(filename = "plot1.png", width = 480, height = 480, bg = NA)
with(y, hist(Global_active_power, main = "Global Active Power", 
             xlab = "Global Active Power (kilowatts)", col = "red"))
dev.off()
