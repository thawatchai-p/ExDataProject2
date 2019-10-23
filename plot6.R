library(dplyr)
library(ggplot2)
## Download the file with unzip
FileURL = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
download.file(FileURL, destfile = "./NEI_data.zip")
unzip(zipfile = "./NEI_data.zip")

## Read the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
df6 <- NEI %>% filter(fips == "24510" | fips == "06037")
SCC.vehicle <- SCC[grep("Mobile.*Vehicles", SCC$EI.Sector),]
SCC.vehicle.list <- unique(SCC.vehicle$SCC)
NEI.vehicle.BMLA <- subset(df6, SCC %in% SCC.vehicle.list)
NEI.vehicle.BMLA <- NEI.vehicle.BMLA %>% group_by(fips, year) %>% summarize(Annual.Total = sum(Emissions))
plot6 <- ggplot(NEI.vehicle.BMLA, aes(year, Annual.Total, fill = fips))
plot6 + geom_bar(stat = "identity", position = "dodge") + xlab("Year") + ylab("Total Emissions (Unit: tons)") +
        ggtitle(expression(atop("Total Emissions from motor vehicle sources", paste("Changed from 1999–2008")))) +
        scale_fill_discrete(name = "City", labels = c("Los Angeles", "Baltimore"))

## Copy plot6 to a PNG file
dev.copy(png, file = "plot6.png")
dev.off()