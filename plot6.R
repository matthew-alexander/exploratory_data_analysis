#Compare emissions from motor vehicle sources in Baltimore City with 
# emissions from motor vehicle sources in Los Angeles County, California 
# (fips == "06037"). Which city has seen greater changes over time in
# motor vehicle emissions?

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
baltimore_LA_vehicle_data <- subset(vehicleEmissions, fips == "24510" | fips == "06037" )

#relabeling the fips codes to the county, probably not the best way to do it
baltimore_LA_vehicle_data$fips <- factor(baltimore_LA_vehicle_data$fips, labels = c("Los Angeles", "Baltimore"))

t <- ggplot(baltimore_LA_vehicle_data, aes(factor(year),Emissions)) +
    geom_bar(stat="identity")+
    facet_grid(. ~ fips)+
    labs(x="Year", y="Emmission (tons)")+
    labs(title="PM2.5 by Source Type")
print(t)

dev.print(png, file = "plot6.png", width = 480, height = 480, bg = "transparent")
