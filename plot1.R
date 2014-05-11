
### Read data in and extract only the days we need, first & second of Feb ###
elec <- read.csv("household_power_consumption.txt",     # read data in
                     ,colClasses="character",header=TRUE,skip=63000,nrows=81000,sep=";")
elec1 <- read.csv("household_power_consumption.txt",     # read data in
                 ,colClasses="character",header=TRUE,nrows=10,sep=";")

names(elec) <- names(elec1)

data <- elec[which(elec$Date=="1/2/2007" | elec$Date=="2/2/2007"),]
data[,3] <- as.numeric(data[,3])


### plot histogram of Global Active Power ###
par(mfrow=c(1,1))
hist(data$Global_active_power,col = "red", main = "Global Active Powr", 
     xlab = "Global Active Power(kilowatts)")


### copy plot to png
dev.copy(png,file="plot1.png")
dev.off()



