plot2 <- function() {
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
        plot(df_hpc1_dt$datetime1,df_hpc1_dt$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
        dev.copy(png, file="plot2.png", width=480, height=480)
        dev.off()
}