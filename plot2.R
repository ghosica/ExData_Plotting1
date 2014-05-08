library(lubridate)

dataall<-read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")
dataall[,1]<-dmy(dataall[,1])
data<-subset(dataall, Date==ymd("2007-02-01")|Date==ymd("2007-02-02"))
rm(dataall)

#change local settings to English
Sys.setlocale("LC_TIME", "English")

#create column with datetime
data$datetime<-as.POSIXct(paste(data$Date, data$Time), format="%Y-%m-%d %H:%M:%S")

##plot2
png("plot2.png")
plot(data$datetime,data$Global_active_power, bg="transparent", type="l",xlab="",ylab="Global Active Power (kilowatts)")
dev.off()
