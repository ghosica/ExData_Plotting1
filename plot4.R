library(lubridate)

dataall<-read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")
dataall[,1]<-dmy(dataall[,1])
data<-subset(dataall, Date==ymd("2007-02-01")|Date==ymd("2007-02-02"))
rm(dataall)

#change local settings to English
Sys.setlocale("LC_TIME", "English")

#create column with datetime
data$datetime<-as.POSIXct(paste(data$Date, data$Time), format="%Y-%m-%d %H:%M:%S")

##plot4
png("plot4.png")
par(mfrow=c(2,2))
with(data, {
        plot(datetime,Global_active_power, bg="transparent", type="l",xlab="",ylab="Global Active Power")
        
        plot(datetime,Voltage, bg="transparent", type="l",ylab="Voltage")
        
        plot(datetime,Sub_metering_1, bg="transparent", type="l",xlab="",ylab="Energy sub metering")
        legend("topright",lwd=c(2.5,2.5), col=c("black","red","blue"),bty="n", cex=0.9, legend=colnames(data[7:9]))
        lines(datetime,Sub_metering_2,col="red", type="l")
        lines(datetime,Sub_metering_3,col="blue", type="l")
        
        plot(datetime,Global_reactive_power, bg="transparent", type="l",ylim=c(0.0,0.5))
        
})
dev.off()
