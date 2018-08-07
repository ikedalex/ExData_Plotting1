# Exploratory Data Analysis Assignment 1 - Plot 2
# Alex Ikeda

# https://davetang.org/muse/2013/05/22/using-aggregate-and-apply-in-r/

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
png("plot2.png", width = 480, height = 480)

# Create a plot
plot(x = mydata$DateTime,
     y = mydata$Global_active_power,
     type = "l",
     xlab = NA,
     ylab = "Global Active Power (kilowatts)")

# Close the file
dev.off()