## Load data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Subset the data fro baltimore
NEI_Baltimore <- subset(NEI,NEI$fips== "24510")

#Summarize emissions  for Baltimore city 
Baltimore_Emission_aggregate <- aggregate(Emissions~type+year,NEI_Baltimore,sum)

png("plot3.png",width=480,height=480)

ggplot(data = Baltimore_Emission_aggregate, aes(factor(year), Emissions)) + 
    facet_wrap(~type,nrow =1,ncol=4)+
  panel_border()+ theme(axis.text.x = element_text(angle = 90, hjust = 1))+
  geom_bar(stat="identity")+
 theme(legend.position="none")+
  ggtitle(expression("PM"[2.5]* "Emissions for Baltimore by source type")) +theme(plot.title = element_text(lineheight=.8, face="bold"))+
  xlab("Years")+theme(axis.text=element_text(size=10)) +
  ylab(expression("PM"[2.5]* "Emissions"))
dev.off()