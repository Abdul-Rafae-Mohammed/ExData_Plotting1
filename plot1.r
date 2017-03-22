#Reading the Dataset
p1_d1 <- read.table("./household_power_consumption.txt",sep = ";",na.strings = "?",header = T)

#Subsetting the DataSet

p1 <- p1_d1[p1_d1$Date %in% c("1/2/2007","2/2/2007"),]

#Creating a Graphics Device
png("plot1.png",height = 480,width = 480)

#plotting a histogram for global active power vs frequency
hist(p1$Global_active_power,xlab = "Global Active Power(Kilowatts)",col = "red",main = "Global Active Power")
#Switching off the graphical device created earlier.
dev.off()