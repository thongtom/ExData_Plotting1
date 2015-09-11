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

# Plot graph 2
plot(datetime, subData$Global_active_power,type="l",
     ylab="Global Active Power (kilowatts)", xlab="")

# Copy chart to png file with 480 width and height
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()