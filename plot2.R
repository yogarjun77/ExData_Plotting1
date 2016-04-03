library(data.table)

hpow <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", nrows= 2075259, stringsAsFactors = FALSE)

hpow_test<-subset(hpow, hpow$Date=="1/2/2007" | hpow$Date=="2/2/2007")

hpow_test$date_time <- as.POSIXct(paste(hpow_test$Date, hpow_test$Time, sep=" "),format = "%d/%m/%Y %H:%M:%S")

#Plot no 2 & save
plot(hpow_test$Global_active_power~hpow_test$date_time, type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.copy(png, file="plot2.png")
dev.off()