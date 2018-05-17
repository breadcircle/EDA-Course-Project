NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

BC <- subset(NEI,NEI$fips == "24510")
TotalEmissions <- tapply(BC$Emissions, BC$year, FUN=sum)
names(TotalEmissions) <- c(1999,2002,2005,2008)
TotalEmissions

png("plot2.png", width=480, height= 480)
barplot(TotalEmissions, 
     xlab= "year", 
     ylab= "Emissions", main= "Baltimore Emissions")
dev.off()
