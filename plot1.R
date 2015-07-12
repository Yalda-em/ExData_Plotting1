

Data <- read.csv(file="household_power_consumption.txt", header=TRUE, sep = ';',na.strings="?")
df<-Data

df$Date <- as.Date(df$Date, format="%d/%m/%Y")
sub<- subset(df,(df$Date) >= ('2007-02-01') & df$Date<= ('2007-02-02'))

  hist(as.numeric(as.character(sub$Global_active_power)),col = 'red', main = paste("Global Active Power"), xlab ="Global Active Power(kilowatts)", ylab="Frequency")
 

  dev.copy(png,'plot1.png', width=480 , height=480)
 dev.off()
 
