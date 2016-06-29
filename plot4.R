#code for Exploratory data analysis week1 assignment
rm(list=ls())
library(dplyr)
library(tidyr)
library(lubridate)

#read_delim(delim = ";") should work. The reason read_csv2 removes the decimal in Voltage is because
#that funciton assumes "," as decimals.)
file="../household_power_consumption.txt"

df <- read.table(file, header=T, sep=";", na.strings=c("?",""," "), stringsAsFactor=F)
d <- df[df$Date %in% c("1/2/2007","2/2/2007"), ]

rm(df)

#plot 4
d <- mutate(d, datetime=paste(Date, Time, sep=" ")) #combine date and time to new column
d$datetime  <- dmy_hms(d$datetime)   #using lubridate package to conver time.
png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))  #establish 2 row 2 column plot
plot(d$datetime, d$Global_active_power, type="l", xlab = "",
     ylab = "Global Active Power")

plot(d$datetime, d$Voltage, type="l", xlab="datetime", ylab="Voltage")

plot(d$datetime, d$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
lines(d$datetime, d$Sub_metering_2, type="l", col="red")
lines(d$datetime, d$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

plot(d$datetime, d$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()
