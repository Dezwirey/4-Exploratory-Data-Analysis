library(ggplot2)

# reading and subsetting data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
balt <- subset(NEI, fips == "24510")

# summing emission data per year per type
data <- aggregate(Emissions ~ year + type, balt, sum)

# plotting
png(file = "plot3.png", width = 700, height = 480)
g <- ggplot(data, aes(year, Emissions, color = type))
g <- g + geom_line() +
        xlab("Year") +
        ylab(expression("Total PM"[2.5]*" Emissions")) +
        ggtitle("Total Emissions per type in Baltimore")
print(g)
dev.off()