plot2<-function(){
  g_data <- read.csv('household_power_consumption.txt',sep=';')
  g1_data<-g_data
  g1_data$DateTime<-as.POSIXct(paste(g1_data$Date,g1_data$Time),format="%d/%m/%Y %H:%M:%S")
  g1_data$Date<-as.Date(g1_data$Date,format("%d/%m/%Y"))
  g1_data$Time<-strptime(g1_data$Time,format("%H:%M:%S"))
  g2_data<-subset(g1_data,g1_data$Date >= '2007-02-01' & g1_data$Date <= '2007-02-02')
  plot(g2_data$DateTime,as.numeric(as.character(g2_data$Global_active_power)),type="n",main="",xlab="",ylab="Global Active Power(Kilowatts)")
  lines(g2_data$DateTime,as.numeric(as.character(g2_data$Global_active_power)),type="l")
  dev.copy(png,file="plot2.png")
  dev.off()
}