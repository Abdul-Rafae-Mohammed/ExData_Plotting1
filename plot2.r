#Reading the Dataset
p1_d2 <- read.table("./household_power_consumption.txt",sep = ";",na.strings = "?",header = T)

#Subsetting the DataSet

p2 <- p1_d2[p1_d2$Date %in% c("1/2/2007","2/2/2007"),]

#Creating a Graphics Device
png("plot2.png",height = 480,width = 480)

#Modifying the Date column to date time
Date_with_Time = strptime(paste(p2$Date,p2$Time,sep = " "), "%d/%m/%Y %H:%M:%S")

#plotting line graph for datetime vs global active power
plot(Date_with_Time,p2$Global_active_power,type = "l",xlab = "",ylab = "Global Active Power(Kilowatts)")
#Switching off the graphical device created earlier.
dev.off()