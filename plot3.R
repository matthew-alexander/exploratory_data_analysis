# Of the four types of sources indicated by the type 
# (point, nonpoint, onroad, nonroad) variable, which
# of these four sources have seen decreases in emissions
# from 1999-2008 for Baltimore City? Which have seen increases 
# in emissions from 1999-2008? Use the ggplot2 plotting system 
# to make a plot answer this question.

setwd("~/GitHub/exploratory_data_analysis")
library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

baltimore_data <- subset(NEI,fips == "24510" )

t <- ggplot(baltimore_data, aes(factor(year),Emissions)) +
        geom_bar(stat="identity")+
        facet_grid(. ~ type)+
        labs(x="Year", y="Emmission (tons)")+
        labs(title="PM2.5 by Source Type")
print(t)


dev.print(png, file = "plot3.png", width = 480, height = 480, bg = "transparent")
