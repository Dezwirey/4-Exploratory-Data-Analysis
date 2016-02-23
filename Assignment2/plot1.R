# reading data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# summing emission data per year
totalEmissions <- tapply(NEI$Emissions, NEI$year, sum)

# plotting
png(file = "plot1.png", width = 480, height = 480)
barplot(totalEmissions, xlab = "Year", ylab = "Total Emission (ton)", 
        main = "Total Emission per year")
dev.off()
