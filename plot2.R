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

#plot 2
d <- mutate(d, datetime=paste(Date, Time, sep=" ")) #combine date and time to new column
d$datetime  <- dmy_hms(d$datetime)   #using lubridate package to conver time.
png("plot2.png", width=480, height=480) 
plot(d$datetime, d$Global_active_power, type="l", xlab = "",
     ylab = "Global Active Power (kilowatts)")
dev.off()