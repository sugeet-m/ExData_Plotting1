## To simplify coding, the zipped file was downloaded, unzipped and the relevant
## file was placed in working directory

## Read input file
data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.string = "?")

## Check column classes and example values
str(data)

## Extract data for the relevant dates
selected <- subset(data, data$Date == "1/2/2007" | data$Date == "2/2/2007")

## Combine date and time and covert to desired format
selected$DateTime <- paste(gsub("/", "-", selected$Date), selected$Time)
selected$DateTime <- as.POSIXct(selected$DateTime, format = "%d-%m-%Y %H:%M:%S")

## Graph 4
## Could not figure out how to change the axis tick names to (Thu, Fri, Sat)
## Plots don't fit  properly with default square plot so changed output dimensions
png("plot4.png", width = 720, height = 720)
par(mfcol= c(2,2))

##Topleft corner
plot(selected$DateTime, selected$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")

##Bottomleft corner
plot(selected$DateTime, selected$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
lines(selected$DateTime, selected$Sub_metering_1)
lines(selected$DateTime, selected$Sub_metering_2, col = "Red")
lines(selected$DateTime, selected$Sub_metering_3, col = "Blue")
legend("topright", lty = 1, col = c("black", "red","blue"), legend = c("Sub metering 1", "Sub metering 2", "Sub metering 3"))

##Topright corner
plot(selected$DateTime, selected$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

##Bottomright corner
plot(selected$DateTime, selected$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
dev.off()
