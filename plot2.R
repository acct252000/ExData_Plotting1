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
#open png graphics device
png(filename="plot2.png",width=480, height=480)
#generate blank plot
plot(subPowerData$exactTime,subPowerData$Global_active_power, type="n", xlab="", ylab="Global Active Power (kilowatts)")
#add line plot
lines(subPowerData$exactTime,subPowerData$Global_active_power, type="l")
#close graphics device
dev.off()
