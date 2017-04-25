#read data into R
allPowerData<-read.table("household_power_consumption.txt",header = TRUE,sep=";",stringsAsFactors = FALSE)
#subset data into February 1 2007 and February 2 2007, data is in day/month/year format
subPowerData<-allPowerData[which(allPowerData$IDate == "1/2/2007" | allPowerData$IDate == "2/2/2007"),]
#convertIDate to Date class
subPowerData$IDate <-strptime(subPowerData$IDate,format="%d/%m/%Y")
#convert Global_active_power column to numeric
subPowerData$Global_active_power<-as.numeric(subPowerData$Global_active_power)
#open png graphics device
png(filename="plot1.png",width=480, height=480)
#generate histogram
hist(subPowerData$Global_active_power, xlab="Global Active Power (kilowatts)", main="Global Active Power", col="red")
#close graphics device
dev.off()