library("ggplot2")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

fipscode <- c("24510","06037")
BCLA <- filter(NEI,NEI$fips %in% fipscode)
BCLA <- filter(BCLA, BCLA$type == "ON-ROAD")
TotalEmissions <- aggregate(BCLA$Emissions, by=list(BCLA$year, BCLA$fips), FUN=sum)
names(TotalEmissions) <- c("Year","fips","Emissions")
TotalEmissions


png("plot6.png", width=480, height= 480)
ggplot(TotalEmissions, aes(x = Year, y = Emissions, color = fips)) + 
  geom_line() + 
  ggtitle("Emissions in Baltimore City and Los Angeles")
dev.off()
