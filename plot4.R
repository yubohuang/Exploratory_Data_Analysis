rm(list=ls())
setwd("C:/Users/YuBo/Dropbox/Data_Science/Exploratory_Data_Analysis/Project1")
datalocation = "./household_power_consumption.txt"
data = read.table(datalocation,header = TRUE, sep = ";",stringsAsFactors = FALSE, dec = ".")
subsetdata = data[data$Date %in% c("1/2/2007","2/2/2007") ,]
datatime = strptime(paste(subsetdata$Date, subsetdata$Time,sep = " "),"%d/%m/%Y %H:%M:%S")
gap = as.numeric(subsetdata$Global_active_power)
voltage = as.numeric(subsetdata$Voltage)
submetering1 = as.numeric(subsetdata$Sub_metering_1)
submetering2 = as.numeric(subsetdata$Sub_metering_2)
submetering3 = as.numeric(subsetdata$Sub_metering_3)

png("plot4.png",width = 480, height = 480)

par(mfrow = c(2,2))

plot(datatime, gap, type = "l", xlab = "", ylab = "Global Acitve Power",cex = 0.2)
plot(datatime,voltage, type = "l",xlab = "datatime",ylab = "Voltage")
plot(datatime,submetering1,type = "l",ylab = "Energy Submetering", xlab = "")

lines(datatime, submetering2,type = "l",col = "red")
lines(datatime, submetering3,type = "l",col = "blue")
legend("topright",c("Sub_metering1","Sub_meterting2","Sub_metering3"),lty = 1, lwd = 2.5, col=c("black","red","blue"),bty = "o")

plot(datatime,gap,type = "l", xlab = "datatime", ylab = "Global Active Power")

dev.off()
