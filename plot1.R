library(dplyr)
## Download the file with unzip
FileURL = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
download.file(FileURL, destfile = "./NEI_data.zip")
unzip(zipfile = "./NEI_data.zip")

## Read the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
NEI$year <- as.factor(NEI$year)
df1 <- aggregate(data = NEI, Emissions ~ year, sum)
barplot(height = df1$Emissions/1000000, names.arg = df1$year, 
        xlab = "year", ylab = "Total PM2.5 (unit: million tons)",
        main = "Total Emissions from PM2.5 in the United States")

## Copy plot1 to a PNG file
dev.copy(png, file = "plot1.png")
dev.off()
