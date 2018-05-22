if (!exists("NEI")) {
        NEI <- readRDS("summarySCC_PM25.rds")
}        
if(!exists("SCC")){
        SCC <- readRDS("Source_Classification_Code.rds")
}

#Set device
png(filename ="plot1.png", width = 480, height = 480, units = "px")

#1. Plot total pm2.5 per year to check if they have decreased
sum_emissions_year <- tapply(NEI$Emissions, NEI$year, sum)
barplot(height = sum_emissions_year/1000, names.arg = names(sum_emissions_year)
     , type = "l", xlab = "Year"
     , ylab = "Total Emissions in thousands of tons"
     , main = "Total Emissions of PM2.5 vs year")

dev.off()