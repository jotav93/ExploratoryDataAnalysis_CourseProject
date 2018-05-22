if (!exists("NEI")) {
        NEI <- readRDS("summarySCC_PM25.rds")
}        
if(!exists("SCC")){
        SCC <- readRDS("Source_Classification_Code.rds")
}
#Set device
png(filename ="plot2.png", width = 480, height = 480, units = "px")

#1. Plot total pm2.5 per year to check if they have decreased
sum_emissions_year <- tapply(NEI[NEI$fips==24510,"Emissions"],
                             NEI[NEI$fips==24510,"year"],sum)
barplot(height = sum_emissions_year, arg.names = names(sum_emissions_year)
     , type = "l", xlab = "Year"
     , ylab = "Total Emissions in tons"
     , main = "Total Emissions of PM2.5 in Baltimore vs year")

dev.off()