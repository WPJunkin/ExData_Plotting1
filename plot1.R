getwd()
library("dplyr")

#Data preparation
file <- tbl_df(read.table("household_power_consumption.txt", header=TRUE, sep= ";", na.strings = c("?","")))
file$Date <- as.Date(file$Date, format = "%d/%m/%Y")
file$timetemp <- paste(file$Date, file$Time)
file$Time <- strptime(file$timetemp, format = "%Y-%m-%d %H:%M:%S")
epc2<-file[file$Date=="2007-02-01"|file$Date=="2007-02-02",]
epc2$Global_active_power<-as.numeric(epc2$Global_active_power)


#Plot 1
png(file = "plot1.png", width = 480, height = 480)
hist(epc2$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power" )
dev.off()
