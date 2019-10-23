library(dplyr)
library(ggplot2)
## Download the file with unzip
FileURL = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
download.file(FileURL, destfile = "./NEI_data.zip")
unzip(zipfile = "./NEI_data.zip")

## Read the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
SCC.coal <- SCC[grep("Fuel Comb.*Coal", SCC$EI.Sector),]
SCC.coal.list <- unique(SCC.coal$SCC)
NEI.coal <- subset(NEI, SCC %in% SCC.coal.list)
NEI.coal <- NEI.coal %>% group_by(type, year) %>% summarize(Annual.Total = sum(Emissions))
NEI.coal$Annual.Total <- as.vector(NEI.coal$Annual.Total)
plot4 <- ggplot(data = NEI.coal, aes(x = year, y = Annual.Total/1000, fill = type))
plot4 + geom_bar(stat = "identity") + ggtitle(expression(atop("Emissions from coal combustion-related sources", paste("Changed from 1999–2008")))) + labs(x = "Year", y = "Total Emissions (Unit: kilotons)")

## Copy plot4 to a PNG file
dev.copy(png, file = "plot4.png")
dev.off()