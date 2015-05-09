#Read data
house=read.table("household_power_consumption.txt",
                 sep=";",header=T,na.strings="?")

#Convert to Date
house$Date=as.Date(house$Date,format="%d/%m/%Y")

#Subset data to required date
Date1=as.Date("2007-02-01","%Y-%m-%d")
Date2=as.Date("2007-02-02","%Y-%m-%d")
house2=subset(house,Date>=Date1 & Date <= Date2)

#Combine Date and Time to single column
#Convert to Date and Time formate
house2$DateAndTime=paste(house2$Date,house2$Time,sep=" ")
house2$DateAndTime=strptime(house2$DateAndTime,"%Y-%m-%d %H:%M:%S")

#Plot3
#Save to PNG File
png("plot3.png")
plot(house2$DateAndTime,house2$Sub_metering_1,"l",xlab="",ylab="Energy sub metering")
lines(house2$DateAndTime,house2$Sub_metering_2,col="RED")
lines(house2$DateAndTime,house2$Sub_metering_3,col="BLUE")
legend("topright","(x,y)",legend=c("Sub_metering_1",
                                   "Sub_metering_2","Sub_metering_3"),
       col=c("BLACK","RED","BLUE"),lty=c(1,1,1),pch=NA,cex=.75)
dev.off()
