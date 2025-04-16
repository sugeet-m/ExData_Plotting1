## To simplify coding, the zipped file was downloaded, unzipped and the relevant
## file was placed in working directory

## Read input file
data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.string = "?")

## Check column classes and example values
head(data)
sapply(names(data), class)

## Extract data for the relevant dates
selected <- subset(data, data$Date == "1/2/2007" | data$Date == "2/2/2007")

## Graph 1
selected[,3] <- as.numeric(selected[,3])
hist(selected$Global_active_power, col = "Red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")

## Print output
dev.copy(png, file = "plot1.png")
dev.off()



