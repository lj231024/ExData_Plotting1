#Q--How to use?
#A--Directly Source!

###package (dplyr) was used to tidy the data. 

#1. Download the data
##The data will be stored in "./ExData_Plotting1_LIUJUN"###

if(file.exists("./ExData_Plotting1_LIUJUN")==FALSE){
        dir.create("./ExData_Plotting1_LIUJUN")
        print("The file is saved in the following directory")
        setwd("./ExData_Plotting1_LIUJUN")
        wd <- getwd()
        print(wd)
        download_url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
        download.file(download_url, "Dataset_Plotting1.zip")
        unzip("Dataset_Plotting1.zip")
}else{
        print("The file directory already exists")
        setwd("./ExData_Plotting1_LIUJUN")
}

#My_data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)
My_data_name <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, nrows =1 )
partial_data <- read.table("household_power_consumption.txt", sep = ";", header = FALSE, skip = 66637, nrows = 2880, col.names = c(names(My_data_name)))

#2. Tidy up the Data
library(dplyr)
partial_data_tbl <- tbl_df(partial_data)
partial_data_tbl_1 <- mutate(partial_data_tbl, Date_time = paste(Date, Time))
partial_data_tbl_2 <- mutate(partial_data_tbl_1, Date_time = strptime(Date_time, "%d/%m/%Y %H:%M:%S"))

#3. Plotting
with(partial_data_tbl_2, plot(Date_time,Sub_metering_1, xlab = NA, ylab = "Energy sub metering", type="l"))
with(partial_data_tbl_2, lines(Date_time,Sub_metering_2, col = "red"))
with(partial_data_tbl_2, lines(Date_time,Sub_metering_3, col = "blue"))
legend("topright",lty = 1, col=c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

png("plot3.png", width = 480, height = 480, units = "px")
with(partial_data_tbl_2, plot(Date_time,Sub_metering_1, xlab = NA, ylab = "Energy sub metering", type="l"))
with(partial_data_tbl_2, lines(Date_time,Sub_metering_2, col = "red"))
with(partial_data_tbl_2, lines(Date_time,Sub_metering_3, col = "blue"))
legend("topright",lty = 1, col=c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()


setwd("../")