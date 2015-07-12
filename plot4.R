Data <- read.csv(file="household_power_consumption.txt", header=TRUE, sep = ';',na.strings="?")
df<-Data

df$Date <- as.Date(df$Date, format="%d/%m/%Y")
sub<- subset(df,(df$Date) >= ('2007-02-01') & df$Date<= ('2007-02-02'))
datetime <- paste(as.Date(sub$Date), sub$Time)
sub$Datetime <- as.POSIXct(datetime)

par(mfrow = c(2, 2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))


plot(sub$Global_active_power~sub$Datetime, type="l",   ylab="Global Active Power (kilowatts)", xlab="")
plot(sub$Datetime,sub$Voltage,  ylab = "Voltage", xlab="datetime",type="l")
  plot(sub$Sub_metering_1~sub$Datetime,  type="n", ylab = "Energy sub metering", xlab="")
  
  lines(sub$Sub_metering_1~sub$Datetime,col=("BLACK"))
  lines(sub$Sub_metering_2~sub$Datetime,col=("RED") )
  lines(sub$Sub_metering_3~sub$Datetime,col=("BLUE") )
  legend('topright', c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),    lty=c(1,1), col=c('black','red', 'blue'), bty='o', cex=.60)
  
  plot( sub$Global_reactive_power~sub$Datetime, ylab = "Global_reactive_Power", xlab = "datetime", type="l")
  


dev.copy(png,'plot4.png', width=480 , height=480)
dev.off()

