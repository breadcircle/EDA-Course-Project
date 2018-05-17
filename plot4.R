NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

mrg <- merge(NEI, SCC, by = "SCC")

Coal <- grepl("Coal", mrg$EI.Sector, ignore.case=TRUE)
CC <- mrg[Coal, ]

TotalEmissions <- tapply(CC$Emissions, CC$year, FUN=sum)
names(TotalEmissions) <- c(1999,2002,2005,2008)
TotalEmissions

png("plot4.png", width=480, height= 480)
barplot(TotalEmissions, 
        xlab= "year", 
        ylab= "Emissions", main= "TotalEmissions")
dev.off()
