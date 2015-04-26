setwd("D:/downloads/coursera/exdata-data-NEI_data")

if(!"PMSCC" %in% ls())
{
  PMSCC <- readRDS("./summarySCC_PM25.rds")  
}

if(!"sourceData" %in% ls())
{
  sourceData <- readRDS("./Source_Classification_Code.rds")  
}

png(filename="plot1.png", 
    width=480, height=480,
    bg="white", units = "px")

totalEmission <- aggregate(PMSCC$Emissions, list(PMSCC$year), FUN=sum)
plot(totalEmission, type="l", xlab="Year", main="Total Emissions in the US from 1999 until 2008")
dev.off()