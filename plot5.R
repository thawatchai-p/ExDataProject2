library(dplyr)
library(ggplot2)
## Download the file with unzip
FileURL = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
download.file(FileURL, destfile = "./NEI_data.zip")
unzip(zipfile = "./NEI_data.zip")

## Read the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
dfBM <- NEI %>% filter(fips == "24510")
SCC.vehicle <- SCC[grep("Mobile.*Vehicles", SCC$EI.Sector),]
head(SCC.vehicle)
SCC.vehicle.list <- unique(SCC.vehicle$SCC)
NEI.vehicle <- subset(dfBM, SCC %in% SCC.vehicle.list)
NEI.vehicle <- NEI.vehicle %>% group_by(year) %>% summarize(Annual.Total = sum(Emissions))
plot5 <- ggplot(NEI.vehicle, aes(year, Annual.Total))
plot5 + geom_bar(stat = "identity") + xlab("Year") + ylab("Total Emissions (Unit: tons)") +
        ggtitle(expression(atop("Total Emissions from motor vehicle sources", paste("Changed from 1999–2008 in Baltimore City"))))

## Copy plot5 to a PNG file
dev.copy(png, file = "plot5.png")
dev.off()