rm(list=ls())
#Load and format the data
info = read.table(file = "household_power_consumption.txt",
                  header = FALSE,
                  quote = "",
                  sep = ";",
                  na.strings = "?",
                  skip = 66637,
                  nrow = 2880,
                  col.names = c("Date",
                                "Time",
                                "Global_active_power",
                                "Global_reactive_power",
                                "Voltage",
                                "Global_intensity",
                                "Sub_metering_1",
                                "Sub_metering_2",
                                "Sub_metering_3"),
                  stringsAsFactors = FALSE
)
info$Date = as.Date(info$Date,format = "%d/%m/%Y")
info$Time = strptime(paste(info$Date,info$Time),format = "%Y-%m-%d %H:%M:%S")

# Plot to screen
with(info,plot(Time,Sub_metering_1, col = "black",type = "l",xlab = "",  ylab = "Energy sub metering"))
with(info,lines(Time,Sub_metering_2, col = "red"))
with(info,lines(Time,Sub_metering_3, col = "blue"))
legend("topright",legend = c('Sub_metering_1','Sub_metering_2','Sub_metering_3'), col = c('black','red','blue'), lty =1)

# Plot to a png file
png("plot3.png")
with(info,plot(Time,Sub_metering_1, col = "black",type = "l",xlab = "",  ylab = "Energy sub metering"))
with(info,lines(Time,Sub_metering_2, col = "red"))
with(info,lines(Time,Sub_metering_3, col = "blue"))
legend("topright",legend = c('Sub_metering_1','Sub_metering_2','Sub_metering_3'), col = c('black','red','blue'), lty =1)

dev.off()
