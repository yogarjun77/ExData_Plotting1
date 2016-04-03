library(data.table)

hpow <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", nrows= 2075259, stringsAsFactors = FALSE)

hpow_test<-subset(hpow, hpow$Date=="1/2/2007" | hpow$Date=="2/2/2007")

hpow_test$date_time <- as.POSIXct(paste(hpow_test$Date, hpow_test$Time, sep=" "),format = "%d/%m/%Y %H:%M:%S")

#Plot no 1 & save it
hist(hpow_test$Global_active_power, main="Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "red")

dev.copy(png, file="plot1.png")
dev.off()