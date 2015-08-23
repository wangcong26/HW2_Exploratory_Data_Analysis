NEI <- readRDS("data/summarySCC_PM25.rds")
SCC <- readRDS("data/Source_Classification_Code.rds")
library(plyr)
library(ggplot2)
BaltimoreCity <- subset(NEI, fips == "24510")
subsetNEI  <- NEI[NEI$fips=="24510", ]
typePM25ByYear <- ddply(BaltimoreCity, .(year, type), function(x) sum(x$Emissions))
colnames(typePM25ByYear)[3] <- "Emissions"

png("plot3.png")
qplot(year, Emissions, data=typePM25ByYear, color=type, geom="line") +
        ggtitle(expression("Baltimore City" ~ PM[2.5] ~ "Emissions by Source Type and Year")) +
        xlab("Year") + ylab(expression("Total" ~ PM[2.5] ~ "Emissions (tons)"))
dev.off()