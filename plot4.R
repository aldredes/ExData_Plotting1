##########################################################################################################################################################
## This script should be run on the same path as the data file ousehold_power_consumption.txt
## Assuming that exdata-data-household_power_consumption.zip is already downloaded and extracted as household_power_consumption.txt
##########################################################################################################################################################

# Load the data 
hpc_data <-  read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?", stringsAsFactors=FALSE, colClasses="character")
hpc_data$Date <- as.Date(hpc_data$Date,format="%d/%m/%Y")
feb_1_and_2_2007_hpc_data <- hpc_data[hpc_data$Date %in% as.Date(c("2007-02-01", "2007-02-02")), ]

# Prepare the data for the plot
datetime <- strptime(paste(as.character(feb_1_and_2_2007_hpc_data$Date), feb_1_and_2_2007_hpc_data$Time, sep=" "), "%Y-%m-%d %H:%M:%S") 
feb_1_and_2_2007_hpc_data$Global_active_power <- as.numeric(feb_1_and_2_2007_hpc_data$Global_active_power)
feb_1_and_2_2007_hpc_data$Sub_metering_1 <- as.numeric(feb_1_and_2_2007_hpc_data$Sub_metering_1)
feb_1_and_2_2007_hpc_data$Sub_metering_2 <- as.numeric(feb_1_and_2_2007_hpc_data$Sub_metering_2)
feb_1_and_2_2007_hpc_data$Sub_metering_3 <- as.numeric(feb_1_and_2_2007_hpc_data$Sub_metering_3)
feb_1_and_2_2007_hpc_data$Global_reactive_power <- as.numeric(feb_1_and_2_2007_hpc_data$Global_reactive_power)
feb_1_and_2_2007_hpc_data$Voltage <- as.numeric(feb_1_and_2_2007_hpc_data$Voltage)

# Create and save the plot
png(filename = "plot4.png",bg = "transparent")
par(mfrow = c(2, 2)) 

# Put this plot into the upper left of the partition
with(feb_1_and_2_2007_hpc_data, plot(datetime, Global_active_power, type="l", xlab="", ylab="Global Active Power"))

# Put this plot into the upper right of the partition
with(feb_1_and_2_2007_hpc_data, plot(datetime, Voltage, type="l", xlab="datetime", ylab="Voltage"))

# Put this plot into the lower left of the partition
with(feb_1_and_2_2007_hpc_data, plot(datetime, Sub_metering_1, type="l", ylab="Energy sub metering", xlab="", col="black"))
with(feb_1_and_2_2007_hpc_data, lines(datetime, Sub_metering_2, type="l", col="red"))
with(feb_1_and_2_2007_hpc_data, lines(datetime, Sub_metering_3, type="l", col="blue"))
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2, col=c("black", "red", "blue"))

# Put this plot into the lower right of the partition
with(feb_1_and_2_2007_hpc_data, plot(datetime, Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power"))

dev.off()
message("Plot has been saved as plot4.png.")

##########################################################################################################################################################
## END OF SCRIPT
##########################################################################################################################################################