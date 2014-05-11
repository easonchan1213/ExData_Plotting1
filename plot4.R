
### Read data in and extract only the days we need, first & second of Feb ###
elec <- read.csv("household_power_consumption.txt",     # read data in
                 ,colClasses="character",header=TRUE,skip=63000,nrows=81000,sep=";")
elec1 <- read.csv("household_power_consumption.txt",     # read data in
                  ,colClasses="character",header=TRUE,nrows=10,sep=";")

names(elec) <- names(elec1)

data <- elec[which(elec$Date=="1/2/2007" | elec$Date=="2/2/2007"),]

### transform date from cht to data object ###
data[,2] <- paste(data[,1],data[,2],sep=" ")
q <- strptime(data[,2],"%d/%m/%Y %H:%M:%S")


## plot 4 plots
Sys.setlocale(category = "LC_TIME", locale = "C")
par(mfrow=c(2,2))
plot(q,data[,3],type="l",ylab = "Global Active Power(kilowatts)",xlab=" ") #plot 1
plot(q,data[,5],type="l",ylab = "Voltage",xlab="datetime") #plot 2
#plot 3
plot(q,data[,7],col="black",type="l",xlab=" ",ylab="Energy sub metering")
lines(q,data[,8],col="red")
lines(q,data[,9],col="blue")
legend("topright",pch="-",cex=0.3,lwd=1,col=c("black","red","blue"),legend=names(data[7:9]))
# plot 4
plot(q,data[,4],type="l",ylab="Global Reactive Power",xlab="datetime") #plot 4


### copy plot to png
dev.copy(png,file="plot4.png")
dev.off()

Sys.setlocale(category = "LC_ALL", locale = "")