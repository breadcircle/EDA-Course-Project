library("ggplot2")

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

BC <- subset(NEI,NEI$fips == "24510")
TotalEmissions <- aggregate(BC$Emissions, by=list(BC$year, BC$type), FUN=sum)
names(TotalEmissions) <- c("Year","Type","Emissions")
TotalEmissions

png("plot3.png", width=480, height= 480)
ggplot(TotalEmissions, aes(x = Year, y = Emissions, color = Type)) + 
  geom_line() + 
  ggtitle("Emissions in Baltimore City")
dev.off()
