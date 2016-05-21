##Plot 3 is a line graph of 3 Sub-meters.
## and only covers a two day period: 2007-02-01 and 2007-02-02.
## The X-axis is Days and the Y-axis is Energy sub-metering.
## Includes legend in top left corner with the three metters.
##* Sub meter 1 is in black. 
##* Sub meter 2 is in red. 
##* Sub meter 3 is in blue. 

#Point to data to be loaded.
datafile <- "household_power_consumption.txt"

#Load data.
data <- read.table(datafile,
                   header = TRUE, 
                   sep = ";",
                   stringsAsFactors = FALSE,
                   dec = ".",
                   na.strings = "?")

#Subset data for only the two days needed.
subdata <- data[data$Date %in% c("1/2/2007", "2/2/2007"),]

#Create "day" character vector for X-axis. 
datetime <- strptime(paste(subdata$Date, subdata$Time, sep = " "), "%d/%m/%Y %H:%M:%S")

#Create PNG Image.
png("plot3.png", width = 480, height = 480)

#Create line graph with legend
plot(datetime, subdata$Sub_metering_1, type = "l", xlab = "", ylab = "Energy Submetering")
lines(datetime, subdata$Sub_metering_2, type = "l", col = "red")
lines(datetime, subdata$Sub_metering_3, type = "l", col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"), lty = 1, lwd = 2)

#Save PNG Image. 
dev.off()
