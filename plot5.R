#Across the United States, how have emissions from motor vehicles
#sources in Baltimore from 1999-2008?

setwd("~/GitHub/exploratory_data_analysis")
library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# looking for the vehicle sources
vehicleRelated <- grepl("vehicle", SCC$EI.Sector, ignore.case=TRUE)

vehicleSCC <- subset(SCC, grepl("vehicle", EI.Sector, ignore.case=TRUE) == TRUE)
vehicleSCC <- vehicleSCC$SCC

#looking for emisions data from coal sources
vehicleEmissions <-  NEI[NEI$SCC %in% vehicleSCC,]

#subsetting the baltimore location out of the 
baltimore_vehicle_data <- subset(vehicleEmissions,fips == "24510" )

# plotting a bar graph of total coal emissions
t <- ggplot(baltimore_vehicle_data, aes(factor(year),Emissions)) +
    geom_bar(stat="identity")+
    #facet_grid(. ~ type)+
    labs(x="Year", y="Emmissions (tons)")+
    labs(title="PM2.5 by Coal Sources")
print(t)

dev.print(png, file = "plot5.png", width = 480, height = 480, bg = "transparent")
