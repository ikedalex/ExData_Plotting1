# Exploratory Data Analysis Assignment 1 - Plot 1
# Alex Ikeda
# https://stat.ethz.ch/pipermail/r-help/2005-April/070203.html for reference
# http://jofrhwld.github.io/blog/2014/05/23/using_sqldf.html for reference 
# http://www.sthda.com/english/wiki/creating-and-saving-graphs-r-base-graphs for reference

library(sqldf) 
Sys.setlocale("LC_TIME", "English")

setwd("C:/Users/Alex Ikeda/Desktop/Coursera/#4 Data Visualization With R")

file_path <- "C:/Users/Alex Ikeda/Desktop/Coursera/#4 Data Visualization With R/household_power_consumption.txt"
fi <- file(file_path)

mydata <- sqldf("select * from fi where Date in ('1/2/2007', '2/2/2007')",
                file.format = list(header = TRUE, sep = ";"))

close(fi)

# Open a png file
png("plot1.png", width = 480, height = 480)

# Create a plot
hist(mydata$Global_active_power,
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)",
     col = "red")

# Close the file
dev.off()