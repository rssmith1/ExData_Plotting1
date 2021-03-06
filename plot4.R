# plot1
# Read the data

makePlot4<-function() {
  
  mydata<-read.table("household_power_consumption 2.txt",header = TRUE, sep=";", colClass=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"), na.strings=c("?"))

  # convert the date into a proper date class
  mydata$Date<-as.Date(mydata$Date,"%d/%m/%Y")

  #shrink the dataset down into only the ones of interest
  smalldata<-mydata[mydata$Date>="2007-02-01" & mydata$Date <= "2007-02-02",]
  mydatetimes<-as.POSIXct(paste(smalldata$Date, smalldata$Time), 
                            format="%Y-%m-%d %H:%M:%S")
  sd2<-cbind(mydatetimes,smalldata)
  
  # open the png device
  png(filename="plot4.png",bg="transparent")

  # create the layout
  par(mfcol=c(2,2))
  
  
  # create the first plot
  plot(sd2$mydatetimes,sd2$Global_active_power,type = "l" ,xlab = " ", ylab = "Global Active Power (kilowatts)")
  
  
  # create the second plot below
  plot(sd2$mydatetimes,sd2$Sub_metering_1,type = "l" ,xlab = " ", ylab = "Energy sub metering",col="black")
  lines(x=sd2$mydatetimes,y=sd2$Sub_metering_2,col="red")
  lines(x=sd2$mydatetimes,y=sd2$Sub_metering_3,col="blue")
  legend("topright", legend = c("Sub_metering_1" , "Sub_metering_2" , "Sub_metering_3" ),lwd=1, col=c("black","red","blue") , bty = "n")
  
  # create the third plot
  plot(sd2$mydatetimes,sd2$Voltage,type = "l" ,xlab = "datetime", ylab = "Voltage")

  # create the final plot
  plot(sd2$mydatetimes,sd2$Global_reactive_power,type = "l" ,xlab = "datetime", ylab = "Global_reactive_power")
  
  
  dev.off()
}