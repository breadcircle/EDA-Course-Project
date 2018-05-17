NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

TotalEmissions <- tapply(NEI$Emissions, NEI$year, FUN=sum)
names(TotalEmissions) <- c(1999,2002,2005,2008)
TotalEmissions

png("plot1.png", width=480, height= 480)
barplot(TotalEmissions, 
     xlab= "year", 
     ylab= "Emissions", main= "TotalEmissions")
dev.off()
