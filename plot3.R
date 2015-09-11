# Read the data
data <- read.table("./week1_data/household_power_consumption.txt", header=TRUE, sep=';', na.strings="?", 
                   check.names=FALSE, stringsAsFactors=FALSE, comment.char="")

# Convert the date
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

# Take the wanted data filter by date
subData <- data[data$Date >= "2007-02-01" & data$Date <= "2007-02-02", ]

# Remove the big data from memory
rm(data)

# combine and format the datetime 
datetime <- strptime(paste(as.character(subData$Date), subData$Time, sep=" "), "%Y-%m-%d %H:%M:%S") 

# Plot graph 3
plot(datetime, subData$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
lines(datetime, subData$Sub_metering_2, type="l", col="red")
lines(datetime, subData$Sub_metering_3, type="l", col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=1, col=c("black", "red", "blue"))

# Copy chart to png file with 480 width and height
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()