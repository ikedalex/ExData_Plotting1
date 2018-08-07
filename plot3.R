# Exploratory Data Analysis Assignment 1 - Plot 3
# Alex Ikeda

# http://www.sthda.com/english/wiki/add-legends-to-plots-in-r-software-the-easiest-way

library(sqldf) 
library(lubridate)
Sys.setlocale("LC_TIME", "English")

setwd("C:/Users/Alex Ikeda/Desktop/Coursera/#4 Data Visualization With R")

file_path <- "C:/Users/Alex Ikeda/Desktop/Coursera/#4 Data Visualization With R/household_power_consumption.txt"
fi <- file(file_path)

mydata <- sqldf("select * from fi where Date in ('1/2/2007', '2/2/2007')",
                file.format = list(header = TRUE, sep = ";"))

close(fi)

mydata$Date <- as.Date(mydata$Date, format = "%d/%m/%Y")

mydata$DateTime <- paste(mydata$Date, mydata$Time)
mydata$DateTime <- ymd_hms(mydata$DateTime) # mydata$DateTime <- as.POSIXct(mydata$DateTime, format = "%Y-%m-%d %H:%M:%S")

# Open .png file
png("plot3.png", width = 480, height = 480)

# Create a plot
plot(x = mydata$DateTime,
     y = mydata$Sub_metering_1,
     type = "l",
     xlab = NA,
     ylab = "Energy sub metering",
     col = "black")

points(x = mydata$DateTime,
     y = mydata$Sub_metering_2,
     type = "l",
     xlab = NA,
     ylab = "Energy sub metering",
     col = "red")

points(x = mydata$DateTime,
       y = mydata$Sub_metering_3,
       type = "l",
       xlab = NA,
       ylab = "Energy sub metering",
       col = "blue")

legend("topright",
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col = c("black","red","blue"),
       lty = 1:3)

# Close the file
dev.off()