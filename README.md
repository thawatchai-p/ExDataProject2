# ExDataProject2
Exploratory Data Analysis - Course Project 2

## Introduction
Fine particulate matter (PM_{2.5}) is an ambient air pollutant for which there is strong evidence that it is harmful to human health. In the United States, the Environmental Protection Agency (EPA) is tasked with setting national ambient air quality standards for fine PM and for tracking the emissions of this pollutant into the atmosphere. Approximatly every 3 years, the EPA releases its database on emissions of PM_{2.5}. This database is known as the National Emissions Inventory (NEI). You can read more information about the NEI at the [[http://www.epa.gov/ttn/chief/eiinformation.html][EPA National Emissions Inventory web site]].

For each year and for each type of PM source, the NEI records how many tons of PM_{2.5} were emitted from that source over the course of the entire year. The data that we use for this assignment are for 1999, 2002, 2005, and 2008. The data is available [[https://d396qusza40orc.cloudfront.net/exdata%252Fdata%252FNEI_data.zip][here]].

You must address the following questions and tasks in your exploratory analysis. For each question/task you will need to make a single plot. Unless specified, you can use any plotting system in R to make your plot.

Q1: Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? Using the base plotting system, make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.

Q2: Have total emissions from PM2.5 decreased in Baltimore City, Maryland (fips == “24510”) from 1999 to 2008? Use the base plotting system to make a plot answering this question.

Q3: Of the four types of sources indicated by the 𝚝𝚢𝚙𝚎 (point, nonpoint, onroad, nonroad) variable, which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? Which have seen increases in emissions from 1999–2008? Use the ggplot2 plotting system to make a plot answer this question.

Q4: Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?

Q5: How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?

Q6: Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County, California (𝚏𝚒𝚙𝚜 == “𝟶𝟼𝟶𝟹𝟽”). Which city has seen greater changes over time in motor vehicle emissions?
