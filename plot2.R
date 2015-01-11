# plot1
# Read the data

library("ggplot2")

myformatter<-function(x) {
  l<-format(x,"%a")
  l
}
  
makePlot2<-function() {
  
  #  mydata<-read.table("household_power_consumption 2.txt",header = TRUE, sep=";", colClass=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"), na.strings=c("?"))

  # convert the date into a proper date class
  mydata$Date<-as.Date(mydata$Date,"%d/%m/%Y")

  #shrink the dataset down into only the ones of interest
  smalldata<-mydata[mydata$Date>="2007-02-01" & mydata$Date <= "2007-02-02",]
  mydatetimes<-as.POSIXct(paste(smalldata$Date, smalldata$Time), 
                            format="%Y-%m-%d %H:%M:%S")
  #smalldata[,1]<-format(mydatetimes,"%a")
  #smalldata[,1]<-as.numeric(mydatetimes)
  smalldata[,1]<-mydatetimes
  
  # open the png device
  png(filename="plot2.png",bg="transparent")

  # create the histo-plot there
  #ggplot(smalldata$Global_active_power,main = "", ylab = "Global Active Power (kilowatts)",type="l")
  myplot<-ggplot(data=smalldata, aes(x=Date, y=Global_active_power)) + theme_classic() + geom_line() + ylab("Global Active Power (kilowatts)") + xlab("") #+ 
    #scale_x_continuous(breaks=c(as.POSIXct("2007-02-01 00:00:00", format="%Y-%m-%d %H:%M:%S")))
  #myplot + theme(axis.ticks.x = element_blank())
  #myplot + scale_x_continuous(breaks=c(66637),labels=c("Thu"))                
  #axis(side=1,at=c(1,1500,3000),labels=c("Thur","Fri","Sat"))
print(myplot)
  #turn the device off and write the file
  dev.off()
}