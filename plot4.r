#Reading the Dataset
p1_d4 <- read.table("./household_power_consumption.txt",sep = ";",na.strings = "?",header = T)

#Subsetting the DataSet

p4 <- p1_d4[p1_d4$Date %in% c("1/2/2007","2/2/2007"),]

#Creating a Graphics Device
png("plot4.png",height = 480,width = 480)

#Modifying the Date column to date time
Date_with_Time = strptime(paste(p4$Date,p4$Time,sep = " "), "%d/%m/%Y %H:%M:%S")

# Dividing the Base plot into 4 parts
par(mfcol = c(2,2))

#Plotting the first plot into the base plot.
plot(Date_with_Time,p4$Global_active_power,type = "l",xlab = "",ylab = "Global Active Power(Kilowatts)")

# Adding the second plot into the base plot
plot(Date_with_Time,p4$Sub_metering_1,type = "l",xlab = "",ylab = "Energy Sub Metering")
lines(Date_with_Time,p4$Sub_metering_2,type = "l", col = "red")
lines(Date_with_Time,p4$Sub_metering_3,type = "l", col = "blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty = 1,lwd = 2.5 ,col = c("black","red","blue"))

#Adding the third plot into the base plot
plot(Date_with_Time,p4$Voltage,type = "l",xlab = "datetime",ylab = "Voltage")

#Adding the fourth plot into the base plot.
plot(Date_with_Time,p4$Global_reactive_power,type = "l",xlab = "datetime",ylab = "Global Reactive Power")

#Switching off the graphical device created earlier.
dev.off()