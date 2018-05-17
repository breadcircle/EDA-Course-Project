NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

mrg <- merge(NEI, SCC, by = "SCC")

BC <- subset(mrg,mrg$fips == "24510" & mrg$type == "ON-ROAD")
TotalEmissions <- tapply(BC$Emissions, BC$year, FUN=sum)
names(TotalEmissions) <- c(1999,2002,2005,2008)
TotalEmissions

png("plot5.png", width=480, height= 480)
barplot(TotalEmissions, 
        xlab= "year", 
        ylab= "Emissions", main= "TotalEmissions")
dev.off()
