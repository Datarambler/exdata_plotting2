setwd("D:/downloads/coursera/exdata-data-NEI_data")

if(!"PMSCC" %in% ls())
{
  PMSCC <- readRDS("./summarySCC_PM25.rds")  
}

if(!"sourceData" %in% ls())
{
  sourceData <- readRDS("./Source_Classification_Code.rds")  
}

png(filename="plot2.png", 
    width=480, height=480,
    bg="white", units = "px")

baltimore <- PMSCC[PMSCC$fips=="24510",]
totalEmission <- aggregate(baltimore$Emissions, list(baltimore$year), FUN=sum)
plot(totalEmission,type="l",xlab="Year", main="Total Emissions in Baltimore from 1999 until 2008")
dev.off()