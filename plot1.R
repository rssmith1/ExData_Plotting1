# plot1
# Read the data

makePlot1<-function() {
  mydata<-read.table("household_power_consumption 2.txt",header = TRUE, sep=";", colClass=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"), na.strings=c("?"))

  # convert the date into a proper date class
  mydata$Date<-as.Date(mydata$Date,"%d/%m/%Y")

  #shrink the dataset down into only the ones of interest
  smalldata<-mydata[mydata$Date>="2007-02-01" & mydata$Date <= "2007-02-02",]

  # open the png device
  png(filename="plot1.png",bg="transparent")

  # create the histo-plot there
  hist(smalldata$Global_active_power,main = "Global Active Power", xlab = "Global Active Power (kilowatts)",col=2)

  #turn the device off and write the file
  dev.off()
}