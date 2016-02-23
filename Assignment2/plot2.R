# reading and subsetting data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
balt <- subset(NEI, fips == "24510")

# summing emissions per year
totalEmissions <- tapply(balt$Emissions, balt$year, sum)

# plotting
png(file = "plot2.png", width = 480, height = 480)
barplot(totalEmissions, xlab = "Year", ylab = "Total Emission (ton)", 
        main = "Total Emission per year in Baltimore")
dev.off()
