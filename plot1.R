#Plot 1 is a histogram of Global Active Power (kilowatts) in red. 
##Plot 1 has the title "Global Active Power" 
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

#Create PNG Image.
png("plot1.png", width = 480, height = 480)
#Create histogram.
hist(subdata[,3], 
     col = "red", 
     xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency", 
     main = "Global Active Power", 
     ylim = c(0, 1200))
#Save PNG Image. 
dev.off()
