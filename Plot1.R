
## Set Working Directory
setwd("/Users/MustafaChaudry/datasciencecoursera/ExData_Plotting1")

## Downloading and extracting Data Set
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile="data.zip", method="curl")

unzip ("data.zip", exdir = "./")


##Reading Data and Creating Plot 1
data_complete <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
HPCdata <- subset(data_complete, Date %in% c("1/2/2007","2/2/2007"))
HPCdata$Date <- as.Date(HPCdata$Date, format="%d/%m/%Y")
hist(HPCdata$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Purple")

## Saving to file
dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()
## image saved as plot1.png 
