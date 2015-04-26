setwd("D:/downloads/coursera/exdata-data-NEI_data")

if(!"PMSCC" %in% ls())
{
  PMSCC <- readRDS("./summarySCC_PM25.rds")  
}

if(!"sourceData" %in% ls())
{
  sourceData <- readRDS("./Source_Classification_Code.rds")  
}

png(filename="plot4.png", 
    width=480, height=480,
    bg="white", units = "px")

coal <- grep("coal", sourceData$Short.Name, ignore.case=T)
coalSource <- sourceData[coal, ]
coalData <- nData[nData$SCC %in% coalSource$SCC, ]
coalEmission <- aggregate(coalData$Emissions, list(coalData$year), FUN="sum")

plot(coalEmission, type="l", xlab="Year", main="Coal Emission in US from 1999 until 2008")

dev.off()