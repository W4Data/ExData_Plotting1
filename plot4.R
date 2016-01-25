## plot4
plot4 <- function() {
        dataset_url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
        download.file(dataset_url,"household_power_consumption.zip")
        unzip("household_power_consumption.zip", exdir = "hpc_data")
        df_hpc1_dt <- data.frame()
        df_hpc1_dt <- read.delim("hpc_data/household_power_consumption.txt", sep = ";", stringsAsFactors = FALSE)
        df_hpc1_dt <- df_hpc1_dt[66637:69517, ]
        df_hpc1_dt[ , 1] <- as.Date(df_hpc1_dt[ , 1], format = "%d/%m/%Y") ## Column 1: [ , 1] is named Date; this formats it as YYYY/MM/DD
        df_hpc1_dt[ , 2] <- as.factor(df_hpc1_dt[ , 2])
        x <- paste(df_hpc1_dt[ , 1], df_hpc1_dt[ , 2])
        df_hpc1_dt$datetime1 <- x
        df_hpc1_dt$datetime1 <- as.POSIXct(df_hpc1_dt$datetime1)
        df_hpc1_dt$Global_active_power <- as.numeric(as.character(df_hpc1_dt$Global_active_power))
        df_hpc1_dt$Global_reactive_power <- as.numeric(as.character(df_hpc1_dt$Global_reactive_power))
        df_hpc1_dt$Voltage <- as.numeric(as.character(df_hpc1_dt$Voltage))
        df_hpc1_dt$Sub_metering_1 <- as.numeric(as.character(df_hpc1_dt$Sub_metering_1))
        df_hpc1_dt$Sub_metering_2 <- as.numeric(as.character(df_hpc1_dt$Sub_metering_2))
        df_hpc1_dt$Sub_metering_3 <- as.numeric(as.character(df_hpc1_dt$Sub_metering_3))
        par(mfrow=c(2,2))
        
        ##PLOT 1
        plot(df_hpc1_dt$datetime1,df_hpc1_dt$Global_active_power, type="l", xlab="", ylab="Global Active Power")
        ##PLOT 2
        plot(df_hpc1_dt$datetime1,df_hpc1_dt$Voltage, type="l", xlab="datetime", ylab="Voltage")
        
        ##PLOT 3
        plot(df_hpc1_dt$datetime1,df_hpc1_dt$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
        lines(df_hpc1_dt$datetime1,df_hpc1_dt$Sub_metering_2,col="red")
        lines(df_hpc1_dt$datetime1,df_hpc1_dt$Sub_metering_3,col="blue")
        legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1), bty="n", cex=.5) #bty removes the box, cex shrinks the text, spacing added after labels so it renders correctly
        
        #PLOT 4
        plot(df_hpc1_dt$datetime1,df_hpc1_dt$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
        
        #OUTPUT
        dev.copy(png, file="plot4.png", width=480, height=480)
        dev.off()
}