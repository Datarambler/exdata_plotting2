setwd("~/ExData_Plotting2/")

if(!"nData" %in% ls())
{
  nData <- readRDS("./data/summarySCC_PM25.rds")  
}

if(!"sourceData" %in% ls())
{
  sourceData <- readRDS("./data/Source_Classification_Code.rds")  
}

# Question 3 
# Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, which of these four sources have seen decreases in emissions from 1999???2008 for Baltimore City? 
# Which have seen increases in emissions from 1999???2008? Use the ggplot2 plotting system to make a plot answer this question.


library(ggplot2)

png(filename="plot3.png", 
    width=480, height=480,
    bg="white", units = "px")


baltimore <- nData[nData$fips == "24510", ]

g <- ggplot(baltimore, aes(year, Emissions, color = type))
g + geom_line(stat = "summary", fun.y="sum") + ylab("Total Particle Emission") + ggtitle("Total Particle Emission in Baltimore\r\nby emission type from 1999 until 2008")
dev.off()