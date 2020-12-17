library(dplyr)
library(ggplot2)

#unzip data file
unzip("exdata_data_NEI_data.zip")

#Read RDS data
Data<-readRDS("./summarySCC_PM25.rds")
Datainfo<-readRDS("./Source_Classification_Code.rds")

#Data searching on word "Coal" and select the data according to the specific SCC code
Datasearch<-Datainfo[grepl("Coal",Datainfo$Short.Name),]
d4<-subset(Data, SCC %in% Datasearch$SCC)

#Open graphic device
png("plot4.png")

#Bar plotting 
graph<-ggplot(d4,aes(x= factor(year), y = Emissions,fill=type))
graph<-graph+geom_col()
graph<-graph+ggtitle("Total PM2.5 Emissions based on Coal combustion source 
                     for year 1999,2002,2005,2008")
graph<-graph+xlab("Year")+ylab("Total PM2.5 Emissions from Coal Combustion Source")
print(graph)

#Close graphic device
dev.off()
