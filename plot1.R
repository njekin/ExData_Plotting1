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
#df <- tbl_df(df)
#df <- read.csv2("household_power_consumption.txt", na=c("?",""), stringsAsFactor=F)

#d$Date <- dmy(d$Date)
#df$Time <- hms(df$Time)

#plot 1
png("plot1.png", width=480, height=480)  
hist(d$Global_active_power, col="red", 
     xlab="Global Active Power (kilowatts)",
     main = "Global Active Power",
     ylim = c(0,1200),
     xlim = c(0,6)
)
dev.off()
