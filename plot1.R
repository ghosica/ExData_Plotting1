library(lubridate)

dataall<-read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")
dataall[,1]<-dmy(dataall[,1])
data<-subset(dataall, Date==ymd("2007-02-01")|Date==ymd("2007-02-02"))
rm(dataall)

##plot1
png("plot1.png")
hist(data$Global_active_power,col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()