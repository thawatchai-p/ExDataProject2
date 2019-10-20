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
df3 <- aggregate(data = dfBM, Emissions ~ year+type, sum)
df3$type <- factor(df3$type, levels = c("ON-ROAD", "NON-ROAD", "POINT", "NONPOINT")) # Re-order
plot3 <- ggplot(df3, aes(year, Emissions, fill = type))
plot3 + geom_bar(stat = "identity") + facet_grid(. ~ type) + xlab("year") + 
        ylab("Total PM2.5 Emissions") +
        ggtitle("Total Emissions in Baltimore City, Maryland from 1999 to 2008")

## Copy plot3 to a PNG file
dev.copy(png, file = "plot3.png")
dev.off()