setwd("~/GitHub/exploratory_data_analysis")

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

pm_sum <- aggregate(Emissions~year,NEI,sum)
barplot(pm_sum$Emissions,names.arg = pm_sum$year , main="Total PM2.5 Per Year",xlab="Year", ylab = "Emissions (tons)")
dev.print(png, file = "plot1.png", width = 480, height = 480, bg = "transparent")
