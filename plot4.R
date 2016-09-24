#Across the United States, how have emissions from coal 
#combustion-related sources changed from 1999-2008?



setwd("~/GitHub/exploratory_data_analysis")
library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# looking for the coal sources
coalRelated <- grepl("coal", SCC$EI.Sector, ignore.case=TRUE)

coalSCC <- subset(SCC, grepl("coal", EI.Sector, ignore.case=TRUE) == TRUE)
coalSCC <- coalSCC$SCC
#looking for emisions data from coal sources
coalEmissions <-  NEI[NEI$SCC %in% coalSCC,]

# summing the emissions by year
total_coal_emmisions <- aggregate(Emissions~year, data = coalEmissions, sum)

# plotting a bar graph of total coal emissions
t <- ggplot(baltimore_data, aes(factor(year),Emissions)) +
    geom_bar(stat="identity")+
    #facet_grid(. ~ type)+
    labs(x="Year", y="Emmissions (tons)")+
    labs(title="PM2.5 by Coal Sources")
print(t)

dev.print(png, file = "plot4.png", width = 480, height = 480, bg = "transparent")
