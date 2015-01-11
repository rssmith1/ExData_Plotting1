# plot1
# Read the data

makePlot2<-function() {
  
  mydata<-read.table("household_power_consumption 2.txt",header = TRUE, sep=";", colClass=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"), na.strings=c("?"))

  # convert the date into a proper date class
  mydata$Date<-as.Date(mydata$Date,"%d/%m/%Y")

  #shrink the dataset down into only the ones of interest
  smalldata<-mydata[mydata$Date>="2007-02-01" & mydata$Date <= "2007-02-02",]
  mydatetimes<-as.POSIXct(paste(smalldata$Date, smalldata$Time), 
                            format="%Y-%m-%d %H:%M:%S")
  sd2<-cbind(mydatetimes,smalldata)
  
  # open the png device
  png(filename="plot2.png",bg="transparent")

  # create the plot there
  plot(sd2$mydatetimes,sd2$Global_active_power,type = "l" ,xlab = " ", ylab = "Global Active Power (kilowatts)")

  dev.off()
}