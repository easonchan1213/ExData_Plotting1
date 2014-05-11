
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

### draw lines and attach legend ###
par(mfrow=c(1,1))
Sys.setlocale(category = "LC_TIME", locale = "C")
plot(q,data[,7],col="black",type="l",xlab=" ",ylab="Energy sub metering")
lines(q,data[,8],col="red")
lines(q,data[,9],col="blue")
legend("topright",pch="-",lwd=2,col=c("black","red","blue"),legend=names(data[7:9]))
Sys.setlocale(category = "LC_ALL", locale = "")

### copy plot to png
dev.copy(png,file="plot3.png")
dev.off()
