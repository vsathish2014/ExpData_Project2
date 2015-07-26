## Load data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Summarize emissions  for all sources by year
Emission_aggregate <- aggregate(Emissions ~ year,NEI,sum)

png("plot1.png",width=480,height=480)

#used bar plots

barplot(
  (Emission_aggregate$Emissions)/10^5, 
  names.arg=Emission_aggregate$year,
  xlab="Year",
  ylab= expression('PM'[2.5]*'Emissions (10^5 tons)'),
  main= expression('Total PM'[2.5]*'Emissions From All US Sources')
)

dev.off()

 