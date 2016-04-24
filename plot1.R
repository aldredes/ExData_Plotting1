##########################################################################################################################################################
## This script should be run on the same path as the data file household_power_consumption.txt
## Assuming that exdata-data-household_power_consumption.zip is already downloaded and extracted as household_power_consumption.txt
##########################################################################################################################################################

# Load the data 
hpc_data <-  read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?", stringsAsFactors=FALSE, colClasses="character")
hpc_data$Date <- as.Date(hpc_data$Date,format="%d/%m/%Y")
feb_1_and_2_2007_hpc_data <- hpc_data[hpc_data$Date %in% as.Date(c("2007-02-01", "2007-02-02")), ]

# Prepare the data for the plot
feb_1_and_2_2007_hpc_data$Global_active_power <- as.numeric(feb_1_and_2_2007_hpc_data$Global_active_power)

# Create and save the plot
png(filename = "plot1.png",bg = "transparent")
with(feb_1_and_2_2007_hpc_data, hist(Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)"))
dev.off()
message("Plot has been saved as plot1.png.")

##########################################################################################################################################################
## END OF SCRIPT
##########################################################################################################################################################