##Set Working Directory
setwd("/Users/MustafaChaudry/datasciencecoursera/ExData_Plotting1")

## Downloading and extracting Data Set
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile="data.zip", method="curl")

unzip ("data.zip", exdir = "./")


##Reading Data and Creating Plot 3
data_complete <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
HPCdata <- subset(data_complete, Date %in% c("1/2/2007","2/2/2007"))
HPCdata$Date <- as.Date(HPCdata$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(HPCdata$Date), HPCdata$Time)
HPCdata$Datetime <- as.POSIXct(datetime)

with(HPCdata, {
  plot(Sub_metering_1~Datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Datetime,col='Blue')
  lines(Sub_metering_3~Datetime,col='Red')
})
legend("topright", col=c("black", "blue", "red"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Saving to file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()
## Image plot3.png  saved
