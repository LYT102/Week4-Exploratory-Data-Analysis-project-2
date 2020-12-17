library(dplyr)
library(ggplot2)

#unzip data file
unzip("exdata_data_NEI_data.zip")

#Read RDS data
Data<-readRDS("./summarySCC_PM25.rds")

#Select data with fips "24510" indicate Baltimore City
d1<-subset(Data, fips == "24510")

#Sum up the emissions based on year from selected data
d1<-aggregate(formula = Emissions~year,data = d1, FUN= sum)

#Create color variable
cols<-c("orange","yellow","red","blue")

#Open graphic device
png("plot2.png")

#Bar plotting
barplot(height = d1$Emissions, names.arg = d1$year, col=cols, ylim=c(0,4000),
        main = "Total PM2.5 Emissions for Baltimore City of year 1999,2002,2005,2008",
        xlab ="Total PM2.5 Emissions", ylab ="year")

#Close graphic device
dev.off()