library(dplyr)
## Download the file with unzip
FileURL = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
download.file(FileURL, destfile = "./NEI_data.zip")
unzip(zipfile = "./NEI_data.zip")

## Read the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
dfBM <- NEI %>% filter(fips == "24510")
df2 <- aggregate(data = dfBM, Emissions ~ year, sum)
barplot(height = df2$Emissions/1000, names.arg = df2$year, 
        xlab = "year", ylab = "Total PM2.5 (unit: kilotons)",
        main = "Total Emissions from PM2.5 in Baltimore City, Maryland")

## Copy plot3 to a PNG file
dev.copy(png, file = "plot2.png")
dev.off()