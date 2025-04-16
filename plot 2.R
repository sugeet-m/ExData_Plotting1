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

## Figure 2
## Could not figure out how to change the axis tick names to (Thu, Fri, Sat)
plot(selected$DateTime, selected$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

## Print Output
dev.copy(png, file = "plot2.png")
dev.off()