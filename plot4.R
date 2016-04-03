library(data.table)

hpow <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", nrows= 2075259, stringsAsFactors = FALSE)

hpow_test<-subset(hpow, hpow$Date=="1/2/2007" | hpow$Date=="2/2/2007")

hpow_test$date_time <- as.POSIXct(paste(hpow_test$Date, hpow_test$Time, sep=" "),format = "%d/%m/%Y %H:%M:%S")

#Plot no 4

par(mfrow = c(2, 2))
par(bg = "transparent")

#Plot 1/4
plot(hpow_test$date_time, hpow_test$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")

#Plot 2/4
 plot(hpow_test$date_time, hpow_test$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
  
#Plot 3/4 - The tricky legend - but purpose is for quick diagnosis, so as long as graph is readable, it should be ok.

plot(hpow_test$date_time,hpow_test$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), cex = 0.5, lty = 1, bty = "n") 
points(hpow_test$date_time, hpow_test$Sub_metering_1, type="l", pch = "4", col = "black")
points(hpow_test$date_time, hpow_test$Sub_metering_2, type="l", pch = "4", col = "red")
points(hpow_test$date_time, hpow_test$Sub_metering_3, type="l", pch = "4", col = "blue")

#Plot 4/4
plot(hpow_test$date_time, hpow_test$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_Reactive_Power")

dev.copy(png, file="plot4.png")
dev.off()