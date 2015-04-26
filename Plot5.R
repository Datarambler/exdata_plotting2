setwd("D:/downloads/coursera/exdata-data-NEI_data")

if(!"PMSCC" %in% ls())
{
  PMSCC <- readRDS("./summarySCC_PM25.rds")  
}

if(!"sourceData" %in% ls())
{
  sourceData <- readRDS("./Source_Classification_Code.rds")  
}

png(filename="plot5.png", 
    width=480, height=480,
    bg="white", units = "px")

baltimore <- PMSCC[PMSCC$fips == "24510", ]
motor <- grep("motor", sourceData$Short.Name, ignore.case="T")
motorSource <- sourceData[motor, ]
motorData <- baltimore[baltimore$SCC %in% motorSource$SCC,]
motorEmission <- aggregate(motorData$Emissions, list(motorData$year), FUN="sum")

plot(motorEmission, type="l", xlab="Year", main="Motor Vehicle Emission in Baltimore")

dev.off()