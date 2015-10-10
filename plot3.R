getwd()
library("dplyr")

#Data preparation
file <- tbl_df(read.table("household_power_consumption.txt", header=TRUE, sep= ";", na.strings = c("?","")))
file$Date <- as.Date(file$Date, format = "%d/%m/%Y")
file$timetemp <- paste(file$Date, file$Time)
file$Time <- strptime(file$timetemp, format = "%Y-%m-%d %H:%M:%S")
epc2<-file[file$Date=="2007-02-01"|file$Date=="2007-02-02",]
epc2$Global_active_power<-as.numeric(epc2$Global_active_power)


#Plot 3
png(file = "plot3.png", width = 480, height = 480)
plot(epc2$Sub_metering_1, type="n",ylab="Energy sub metering",xaxt="n", xlab="")
points(epc2$Sub_metering_1 ,type="l", col="black")
points(epc2$Sub_metering_2 ,type="l", col="red")
points(epc2$Sub_metering_3 ,type="l", col="blue")
axis(1, at=c(1,nrow(epc2)/2,nrow(epc2)),labels=c("Thu","Fri","Sat"))
legend("topright", lty=1, col = c("black", "red", "blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()
