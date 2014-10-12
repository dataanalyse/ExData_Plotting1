plot3<-function(){
  g_data <- read.csv('household_power_consumption.txt',sep=';')
  g1_data<-g_data
  g1_data$DateTime<-as.POSIXct(paste(g1_data$Date,g1_data$Time),format="%d/%m/%Y %H:%M:%S")
  g1_data$Date<-as.Date(g1_data$Date,format("%d/%m/%Y"))
  g1_data$Time<-strptime(g1_data$Time,format("%H:%M:%S"))
  g2_data<-subset(g1_data,g1_data$Date >= '2007-02-01' & g1_data$Date <= '2007-02-02')
  plot(g2_data$DateTime,as.numeric(as.character(g2_data$Sub_metering_1)),type="n",main="",xlab="",ylab="Global Active Power(Kiloatts)")
  lines(g2_data$DateTime,as.numeric(as.character(g2_data$Sub_metering_1)),type="l",main="",xlab="",ylab="Global Active Power(Kiloatts)",col="black")
  lines(g2_data$DateTime,as.numeric(as.character(g2_data$Sub_metering_2)),type="l",main="",xlab="",ylab="Global Active Power(Kiloatts)",col="orange")
  lines(g2_data$DateTime,as.numeric(as.character(g2_data$Sub_metering_3)),type="l",main="",xlab="",ylab="Global Active Power(Kiloatts)",col="blue")
  legend('topright',c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,lwd=1,col=c("black","orange","blue")) 
  dev.copy(png,file="plot3.png")
  dev.off()
}