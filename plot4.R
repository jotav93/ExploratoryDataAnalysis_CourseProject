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

#Set device
png(filename ="plot4.png", width = 480, height = 480, units = "px")

coalMatches  <- grepl("coal", NEISCC$Short.Name, ignore.case=TRUE)

sub_data <- NEISCC[coalMatches,]

sum_emissions_year <- tapply(sub_data$Emissions, sub_data$year, sum)
barplot(sum_emissions_year, arg.names = names(sum_emissions_year)
     , type = "l", xlab = "Year"
     , ylab = "Total Emissions for coal combustion in thousands of tons"
     , main = "Emissions of PM2.5 for coal combustion  vs year")
dev.off()