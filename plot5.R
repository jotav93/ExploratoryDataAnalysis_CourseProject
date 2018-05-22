if (!exists("NEI")) {
        NEI <- readRDS("summarySCC_PM25.rds")
}        
if(!exists("SCC")){
        SCC <- readRDS("Source_Classification_Code.rds")
}
library(ggplot2)
library(dplyr)
if (!exists("NEISCC")) {
        NEISCC <- merge(NEI, SCC, by="SCC")
}

png(filename ="plot5.png", width = 480, height = 480, units = "px")

sub_data <- NEI[NEI$fips ==24510 & NEI$type == "ON-ROAD",]

new_data <- sub_data %>% group_by(year) %>% summarise(total_emissions = sum(Emissions))

barplot(height = new_data$total_emissions, arg.names = new_data$year
     , type = "l", xlab = "Year"
     , ylab = "Total Emissions for motor vehicles in thousands of tons"
     , main = "Emissions of PM2.5 for motor vehicles  vs year")

dev.off()