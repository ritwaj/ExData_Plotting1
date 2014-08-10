col_names=c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3");
df = read.csv(file="household_power_consumption.txt",header=FALSE,sep=";",dec=".",na.strings="?",skip=66637,nrows=2880,col.names=col_names);
df$DateTime = strptime(paste(df$Date,df$Time),"%d/%m/%Y %H:%M:%S")
df$Date = as.Date(df$Date,"%d/%m/%Y")
png(filename = "plot4.png",width = 480, height = 480, units = "px")
par(mfcol=c(2,2))
plot(y=df$Global_active_power,x=df$DateTime,type="l",xlab="",ylab="Global Active Power (kilowatts)")
plot(y=df$Sub_metering_1,x=df$DateTime,type="l",xlab="",ylab="Energy sub metering", )
lines(y=df$Sub_metering_2,x=df$DateTime,type="l",xlab="",col="red")
lines(y=df$Sub_metering_3,x=df$DateTime,type="l",xlab="",col="blue")
legend(x="topright",bty="n",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1),col=c("black","red","blue"))
plot(y=df$Voltage,x=df$DateTime,type="l",xlab="datetime",ylab="Voltage")
plot(y=df$Global_reactive_power,x=df$DateTime,type="l",xlab="datetime",ylab="Global_reactive_power")
dev.off()