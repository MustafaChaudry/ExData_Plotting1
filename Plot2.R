## Set Working Directory

setwd("/Users/MustafaChaudry/datasciencecoursera/ExData_Plotting1")

## Downloading and extracting Data Set
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile="data.zip", method="curl")

unzip ("data.zip", exdir = "./")


##Reading Data and Creating Plot 2

data_complete <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
HPCdata <- subset(data_complete, Date %in% c("1/2/2007","2/2/2007"))
HPCdata$Date <- as.Date(HPCdata$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(HPCdata$Date), HPCdata$Time)
HPCdata$Datetime <- as.POSIXct(datetime)

## plot 2
with(HPCdata, {
  plot(Global_active_power~Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")
  })

## Saving to file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
## image saved as plot2.png 