library(data.table)

hpow <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", nrows= 2075259, stringsAsFactors = FALSE)

hpow_test<-subset(hpow, hpow$Date=="1/2/2007" | hpow$Date=="2/2/2007")

hpow_test$date_time <- as.POSIXct(paste(hpow_test$Date, hpow_test$Time, sep=" "),format = "%d/%m/%Y %H:%M:%S")

#Plot no 3 & save

plot(hpow_test$date_time,hpow_test$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
points(hpow_test$date_time, hpow_test$Sub_metering_1, type="l", pch = "4", col = "black")
points(hpow_test$date_time, hpow_test$Sub_metering_2, type="l", pch = "4", col = "red")
points(hpow_test$date_time, hpow_test$Sub_metering_3, type="l", pch = "4", col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), cex = 0.7, lty = 1)
dev.copy(png, file="plot3.png")
dev.off()
