## Plot 4 contains four graphs
## and only covers a two day period: 2007-02-01 and 2007-02-02.
## All four graphs have the same X-axis, the "datetime" variable. 
## The Y-axis is (with graph position):
##* Global Active Power (Topleft)
##* Voltage (Topright)
##* Energy sub metering (Bottomleft)
##* Global_reactive_power (Bottomright)

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
png("plot4.png", width = 480, height = 480)

#Sets image to have 4 graphs, setting plots by rows. 
par(mfrow = c(2,2))

#Plot 1: Create line graph of datetime and Global Active Power.
plot(datetime, subdata$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)", cex = 0.5)

#Plot 2: Create line graph of datetime and Voltage.
plot(datetime, subdata$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

#Plot 3: Create line graph with legend
plot(datetime, subdata$Sub_metering_1, type = "l", xlab = "", ylab = "Energy Submetering")
lines(datetime, subdata$Sub_metering_2, type = "l", col = "red")
lines(datetime, subdata$Sub_metering_3, type = "l", col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"), lty = 1, lwd = 2, bty = "n")

#Plot 4: Create line graph of datetime and Global_reactive_power.
plot(datetime, subdata$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

#Save PNG Image. 
dev.off()
