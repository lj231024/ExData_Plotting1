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

#2. Plotting
png("plot1.png", width = 480, height = 480, units = "px")
with(partial_data,hist(Global_active_power, col = "red", main="Global Active Power", xlab = "Global Active Power (kilowatts)"))
dev.off()

par(mfrow=c(1,1),pin=c(5,5),pty="s")
with(partial_data,hist(Global_active_power, col = "red", main="Global Active Power", xlab = "Global Active Power (kilowatts)"))

setwd("../")