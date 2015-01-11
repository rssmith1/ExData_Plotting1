# plot1
# Read the data

makePlot3<-function() {
  
  mydata<-read.table("household_power_consumption 2.txt",header = TRUE, sep=";", colClass=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"), na.strings=c("?"))

  # convert the date into a proper date class
  mydata$Date<-as.Date(mydata$Date,"%d/%m/%Y")

  #shrink the dataset down into only the ones of interest
  smalldata<-mydata[mydata$Date>="2007-02-01" & mydata$Date <= "2007-02-02",]
  mydatetimes<-as.POSIXct(paste(smalldata$Date, smalldata$Time), 
                            format="%Y-%m-%d %H:%M:%S")
  sd2<-cbind(mydatetimes,smalldata)
  
  # open the png device
  png(filename="plot3.png",bg="transparent")

  # create the plot there
  plot(sd2$mydatetimes,sd2$Sub_metering_1,type = "l" ,xlab = " ", ylab = "Energy sub metering",col="black")
  lines(x=sd2$mydatetimes,y=sd2$Sub_metering_2,col="red")
  lines(x=sd2$mydatetimes,y=sd2$Sub_metering_3,col="blue")
  legend("topright", legend = c("Sub_metering_1" , "Sub_metering_2" , "Sub_metering_3" ),lwd=1, col=c("black","red","blue"))
  dev.off()
}