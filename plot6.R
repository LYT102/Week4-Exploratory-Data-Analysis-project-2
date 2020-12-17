library(dplyr)
library(ggplot2)

#unzip data file
unzip("exdata_data_NEI_data.zip")

#Read RDS data
Data<-readRDS("./summarySCC_PM25.rds")

#Select 2 set of data based on fips and "ON-ROAD" type
#"24510" indicate Baltimore City
#"06037" indicate Los Angeles County
db<-subset(Data, fips =="24510"& type =="ON-ROAD")
da<-subset(Data, fips =="06037"& type =="ON-ROAD")

#Sum up the Emissions data based on year for 2 data set
db<-aggregate(Emissions~year,db,sum)
da<-aggregate(Emissions~year,da,sum)

#Adding new column City for 2 data set
db<-mutate(db, City ="Baltimore.City")
da<-mutate(da, City ="Los.Angeles.County")

#Row join for 2 data set
d6<-rbind(db,da)

#Open graphic device
png("plot6.png")

#plotting line graph emissions againts year based on the City
graph<-ggplot(d6,aes(x = year, y= Emissions, color = City))
graph<-graph+geom_line(size = 1)+geom_point(size=3)
graph<-graph+ggtitle("     Baltimore City VS Los Angeles County 
On total emissions for motor vehicle from 1999 to 2008")
graph<-graph+ylab("Total Emissions")+xlab("year")
print(graph)

#Close graphic device
dev.off()