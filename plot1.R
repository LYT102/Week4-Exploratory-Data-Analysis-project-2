library(dplyr)

#unzip data file
unzip("exdata_data_NEI_data.zip")

#Read RDS type data
Data<-readRDS("./summarySCC_PM25.rds")

#Sum up the data from Emissions based on year
d0<-aggregate(formula = Emissions~year, data = Data, FUN = sum)

#create color variable
cols<-c("orange","yellow","red","blue")

#open graphic device
png("plot1.png")

#Bar plotting
barplot(height = d0$Emissions, names.arg = d0$year, ylim = c(0,8000000),col = cols,
        main = "Total PM 2.5 Emissions of Year 1999,2002,2005,2008", xlab ="year",
        ylab = "Total PM 2.5 Emissions")

#close graphic device
dev.off()