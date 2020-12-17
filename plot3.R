library(dplyr)
library(ggplot2)

#unzip data file
unzip("exdata_data_NEI_data.zip")

#Read RDS data
Data<-readRDS("./summarySCC_PM25.rds")

#Select data with fips "24510" indicate Baltimore City
d3<-subset(Data, fips == "24510")

#Sum up the emissions based on year from selected data
d3<-aggregate(formula = Emissions~year + type,data = d3, FUN = sum)

#Open graphic device
png("plot3.png")

#Line graph plotting Emissions against year based on type from selected data
graph<-ggplot(d3,aes(year,Emissions,color=type))
graph<-graph+geom_line()+xlab("year")+ylab("Total PM2.5 Emissions")
graph<-graph+ggtitle("Total PM2.5 Emissions in Baltimore City from 1999 to 2008")
print(graph)

#Close graphic device
dev.off()