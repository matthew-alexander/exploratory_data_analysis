#has PM2.5 decreaseed in baltimore fips == "24510"?
setwd("~/GitHub/exploratory_data_analysis")

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
baltimore_data <- subset(NEI,fips == "24510" )
baltimore_data_yearly_total <- aggregate(Emissions~year,baltimore_data,sum)
barplot(baltimore_data_yearly_total$Emissions,names.arg = baltimore_data_yearly_total$year , main="Total PM2.5 Per Year in Baltimore",xlab="Year", ylab = "Emissions (tons)")
dev.print(png, file = "plot2.png", width = 480, height = 480, bg = "transparent")

