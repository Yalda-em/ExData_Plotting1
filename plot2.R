Data <- read.csv(file="household_power_consumption.txt", header=TRUE, sep = ';',na.strings="?")
df<-Data

df$Date <- as.Date(df$Date, format="%d/%m/%Y")
sub<- subset(df,(df$Date) >= ('2007-02-01') & df$Date<= ('2007-02-02'))
datetime <- paste(as.Date(sub$Date), sub$Time)
sub$Datetime <- as.POSIXct(datetime)
plot(sub$Global_active_power~sub$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")
dev.copy(png,'plot2.png', width=480 , height=480)
dev.off()







