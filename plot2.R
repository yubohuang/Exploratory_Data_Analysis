rm(list=ls())
setwd("C:/Users/YuBo/Dropbox/Data_Science/Exploratory_Data_Analysis/Project1")

datalocation = "./household_power_consumption.txt"

data = read.table(datalocation,header = TRUE, sep = ";",stringsAsFactors = FALSE, dec = ".")

subsetdata = data[data$Date %in% c("1/2/2007","2/2/2007") ,]

datatime = strptime(paste(subsetdata$Date, subsetdata$Time, sep = " "),"%d/%m/%Y %H:%M:%S")
gap = as.numeric(subsetdata$Global_active_power)
png("plot2.png",width=480,height=480)
plot(datatime,gap,type = "l",xlab="",ylab = "Global Active Power (kw)")
dev.off()
