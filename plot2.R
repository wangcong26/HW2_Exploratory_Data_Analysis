NEI <- readRDS("data/summarySCC_PM25.rds")
SCC <- readRDS("data/Source_Classification_Code.rds")

Maryland <- subset(NEI, fips == "24510")

totalPM25yr <- tapply(Maryland$Emissions, Maryland$year, sum)

png("plot2.png")
plot(names(totalPM25yr), totalPM25yr, type="l",
     xlab="Year", ylab=expression("Total" ~ PM[2.5] ~ "Emissions (tons)"),
     main=expression("Total Baltimore City" ~ PM[2.5] ~ "Emissions by Year"))
dev.off()