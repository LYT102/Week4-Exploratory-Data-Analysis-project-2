library(dplyr)
library(ggplot2)

#unzip data file
unzip("exdata_data_NEI_data.zip")

#Read RDS data
Data<-readRDS("./summarySCC_PM25.rds")

##Select data with fips "24510" indicate Baltimore City and "ON-ROAD" for type
d5<-subset(Data, fips =="24510" & type =="ON-ROAD")

#Sum up the emissions data based on year
d5<-aggregate(Emissions~year,d5,FUN=sum)

#Open graphic device
png("plot5.png")

#Plot line graph emissions againts year from the selected data
graph<-ggplot(d5,aes(x=year,y=Emissions))
graph<-graph+geom_line()
graph<-graph+ggtitle("Total Emissions cause from motor vehicle in Baltimore City from 
                     year 1999 to 2008")
graph<-graph+xlab("Year")+ylab("Total Emissions cause from motor vehicle")
print(graph)

#Close device
dev.off()
