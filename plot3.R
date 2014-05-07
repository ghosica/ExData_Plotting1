library(lubridate)

dataall<-read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")
dataall[,1]<-dmy(dataall[,1])
data<-subset(dataall, Date==ymd("2007-02-01")|Date==ymd("2007-02-02"))
rm(dataall)

#change local settings to English
Sys.setlocale("LC_TIME", "English")

#create column with datetime
data$datetime<-as.POSIXct(paste(data$Date, data$Time), format="%Y-%m-%d %H:%M:%S")

##plot3
png("plot3.png")
with(data,{ plot(datetime,Sub_metering_1, type="l",xlab="",ylab="Energy sub metering")
            lines(datetime,Sub_metering_2,col="red", type="l")
            lines(datetime,Sub_metering_3,col="blue", type="l")
})
legend("topright",lwd=c(2.5,2.5), col=c("black","red","blue"), legend=colnames(data[7:9]))
dev.off()