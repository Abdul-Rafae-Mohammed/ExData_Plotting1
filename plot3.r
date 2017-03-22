#Reading the Dataset
p1_d3 <- read.table("./household_power_consumption.txt",sep = ";",na.strings = "?",header = T)

#Subsetting the DataSet

p3 <- p1_d3[p1_d3$Date %in% c("1/2/2007","2/2/2007"),]
#Creating a Graphics Device
png("plot3.png",height = 480,width = 480)

#Modifying the Date column to date time
Date_with_Time = strptime(paste(p3$Date,p3$Time,sep = " "), "%d/%m/%Y %H:%M:%S")

#Plotting the Datetime vs submetering-1
plot(Date_with_Time,p3$Sub_metering_1,type = "l",xlab = "",ylab = "Energy Sub Metering")
# Adding a line plot for submetering -2
lines(Date_with_Time,p3$Sub_metering_2,type = "l", col = "red")
#Addign a line plot for submetering -3
lines(Date_with_Time,p3$Sub_metering_3,type = "l", col = "blue")
#Addign a legend at top right corner of the plot.
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty = 1,lwd = 2.5 ,col = c("black","red","blue"))
##Switching off the graphical device created earlier.
dev.off()