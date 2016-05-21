##Plot 2 is a line graph of Global Active Power (kilowatts)
## and only covers a two day period: 2007-02-01 and 2007-02-02.

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
png("plot2.png", width = 480, height = 480)

#Create line graph
plot(datetime, subdata[,3], type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

#Save PNG Image. 
dev.off()
