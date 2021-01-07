rm(list = ls())


data1 <- read.csv2("./household_power_consumption.txt")

data1$Date <- as.Date(data1$Date, format="%d/%m/%Y")

data2 <- subset(data1, Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02"))

data2$Time <- strptime(paste(data2$Date,data2$Time),"%Y-%m-%d %H:%M")

rm(data1)

colnames(data2) <- tolower(colnames(data2))
colnames(data2) <- gsub("_","",colnames(data2))

data2[,3] <- as.numeric(levels(data2[, 3]))[data2[, 3]]
data2[,4] <- as.numeric(levels(data2[, 4]))[data2[, 4]]
data2[,5] <- as.numeric(levels(data2[, 5]))[data2[, 5]]
data2[,6] <- as.numeric(levels(data2[, 6]))[data2[, 6]]
data2[,7] <- as.numeric(levels(data2[, 7]))[data2[, 7]]
data2[,8] <- as.numeric(levels(data2[, 8]))[data2[, 8]]
data2[,9] <- as.numeric(levels(data2[, 9]))[data2[, 9]]





# summary(data2)

# date: Date in format yyyy-mm-dd
# time: time in format yyyy-mm-dd hh:mm:ss
# globalactivepower: household global minute-averaged active power (in kilowatt)
# globalreactivepower: household global minute-averaged reactive power (in kilowatt)
# voltage: minute-averaged voltage (in volt)
# globalintensity: household global minute-averaged current intensity (in ampere)
# submetering1: energy sub-metering No. 1 (in watt-hour of active energy). It corresponds to the kitchen, containing mainly a dishwasher, an oven and a microwave (hot plates are not electric but gas powered).
# submetering2: energy sub-metering No. 2 (in watt-hour of active energy). It corresponds to the laundry room, containing a washing-machine, a tumble-drier, a refrigerator and a light.
# submetering3: energy sub-metering No. 3 (in watt-hour of active energy). It corresponds to an electric water-heater and an air-conditioner.


png("plot3.png", width = 480, height = 480)


plot(data2$time, data2$globalactivepower, type = "n",main = "", xlab = "", ylab = "Energy sub metering", ylim=c(0,max(data2$submetering1, data2$submetering2, data2$submetering3)))
lines(data2$time, data2$submetering1, col = "black")
lines(data2$time, data2$submetering2, col = "red")
lines(data2$time, data2$submetering3, col = "blue")

legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))


dev.off()















