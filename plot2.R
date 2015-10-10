getwd()
library("dplyr")

#Data preparation
file <- tbl_df(read.table("household_power_consumption.txt", header=TRUE, sep= ";", na.strings = c("?","")))
file$Date <- as.Date(file$Date, format = "%d/%m/%Y")
file$timetemp <- paste(file$Date, file$Time)
file$Time <- strptime(file$timetemp, format = "%Y-%m-%d %H:%M:%S")
epc2<-file[file$Date=="2007-02-01"|file$Date=="2007-02-02",]
epc2$Global_active_power<-as.numeric(epc2$Global_active_power)


#Plot 2
png(file = "plot2.png", width = 480, height = 480)
plot(epc2$Global_active_power, type="n",ylab="Global Active Power (kilowatts)",xaxt="n", xlab="")
points(epc2$Global_active_power,type="l")
axis(1,1:nrow(epc2), at=c(1,nrow(epc2)/2,nrow(epc2)),labels=c("Thu","Fri","Sat"))
dev.off()
