## Load data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Subset the data fro baltimore
NEI_Baltimore <- subset(NEI,NEI$fips== "24510")

#Summarize emissions  for Baltimore city by year
Baltimore_Emission_aggregate <- aggregate(Emissions ~ year,NEI_Baltimore,sum)

png("plot2.png",width=480,height=480)

#used bar plots

barplot(
  (Baltimore_Emission_aggregate$Emissions), 
  names.arg=Baltimore_Emission_aggregate$year,
  xlab="Year",
  ylab=expression("PM"[2.5]* "Emissions"),
  main=expression("Total PM"[2.5]* "Emissions for Baltimore")
)

dev.off()