#read data into R
allPowerData<-read.table("household_power_consumption.txt",header = TRUE,sep=";",stringsAsFactors = FALSE)
#subset data into February 1 2007 and February 2 2007, data is in day/month/year format
subPowerData<-allPowerData[which(allPowerData$IDate == "1/2/2007" | allPowerData$IDate == "2/2/2007"),]
#convertIDate to Date class
subPowerData$IDate <-as.Date(subPowerData$IDate,format="%d/%m/%Y")
#convert Global_active_power column to numeric
subPowerData$Global_active_power<-as.numeric(subPowerData$Global_active_power)
#add exactTime column
subPowerData$exactTime <- as.POSIXct(paste(subPowerData$IDate, subPowerData$Time), format="%Y-%m-%d %H:%M:%S")
#convert Sub_metering_1 to numeric
subPowerData$Sub_metering_1<-as.numeric(subPowerData$Sub_metering_1)
#convert Sub_metering_2 to numeric
subPowerData$Sub_metering_2<-as.numeric(subPowerData$Sub_metering_2)
#convert Sub_metering_3 to numeric
subPowerData$Sub_metering_3<-as.numeric(subPowerData$Sub_metering_3)
#open png graphics device
png(filename="plot3.png",width=480, height=480)
#generate blank plot
plot(subPowerData$exactTime,subPowerData$Sub_metering_1, type="n", xlab="", ylab="Energy sub metering")
#add line plot for Sub_metering_1
lines(subPowerData$exactTime,subPowerData$Sub_metering_1, type="l")
#add line plot for Sub_metering_2
lines(subPowerData$exactTime,subPowerData$Sub_metering_2, type="l", col="red")
#add line plot for Sub_metering_3
lines(subPowerData$exactTime,subPowerData$Sub_metering_3, type="l", col="blue")
#add legend
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black","red","blue"),lty=1)
#close graphics device
dev.off()