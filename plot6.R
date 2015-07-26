#load the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Gather the subset of the NEI data which corresponds to vehicles
vehiclesIndex <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)
vehiclesSCC <- SCC[vehiclesIndex,]$SCC
vehiclesNEI <- NEI[NEI$SCC %in% vehiclesSCC,]

# Subset the vehicles NEI data to Los Angeles County fip
losangelesVehiclesNEI <- vehiclesNEI[vehiclesNEI$fips=="06037",]

# Subset the vehicles NEI data to Baltimore's fip
baltimoreVehiclesNEI <- vehiclesNEI[vehiclesNEI$fips=="24510",]

png("plot6.png",width=960,height=480)

ggp1 <- ggplot(baltimoreVehiclesNEI,aes(factor(year),Emissions)) +
  geom_bar(stat="identity",fill="blue",width=0.75) +
  theme_bw() +  guides(fill=FALSE) +
  labs(x="year", y=expression("Total PM"[2.5]*" Emission (10^5 Tons)")) + 
  labs(title=expression("Vehicle Emissions in Baltimore"))+
  coord_cartesian(ylim=c(0,8000))
 
ggp2 <- ggplot(losangelesVehiclesNEI,aes(factor(year),Emissions)) +
  geom_bar(stat="identity",fill="blue",width=0.75) +
  theme_bw() +  guides(fill=FALSE) +
  labs(x="year", y=expression("Total PM"[2.5]*" Emission (10^5 Tons)")) + 
  labs(title=expression(" Vehicle Emissions in Los Angeles"))+
  coord_cartesian(ylim=c(0,8000))

library(grid)
source("http://peterhaschke.com/Code/multiplot.R")
ggp <- multiplot(ggp1,ggp2,cols =2)

print(ggp)

dev.off()