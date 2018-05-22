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

png(filename ="plot6.png", width = 480, height = 480, units = "px")

sub_data <- NEI[(NEI$fips =="24510" | NEI$fips=="06037")& NEI$type == "ON-ROAD",]
sub_data$city <- factor(sub_data$fips, levels = c("24510","06037"), labels = c("Baltimore","Los Angeles"))

new_data <- sub_data %>% group_by(year, city) %>% summarise(total_emissions = sum(Emissions))


qplot(year, total_emissions, data = new_data, col = city, xlab = "Year"
      ,ylab = "Total emissions in tons", main = "Total emissions by city and year")

dev.off()