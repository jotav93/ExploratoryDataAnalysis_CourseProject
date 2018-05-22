if (!exists("NEI")) {
        NEI <- readRDS("summarySCC_PM25.rds")
}        
if(!exists("SCC")){
        SCC <- readRDS("Source_Classification_Code.rds")
}
library(ggplot2)
library(dplyr)
#Set device
png(filename ="plot3.png", width = 480, height = 480, units = "px")

sub_data <- NEI[NEI$fips ==24510,]
#getting year and type and sum
new_data <- sub_data %>% group_by(year, type) %>% summarise(total_emissions = sum(Emissions))

qplot(year, total_emissions, data = new_data, col = type, geom = 'path')

dev.off()