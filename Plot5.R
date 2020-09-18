vehicles <- grepl("vehicle", SCC_names$SCC.Level.Two, ignore.case=TRUE)
vehiclesSCC <- SCC_names[vehicles,]$SCC
vehiclesNEI <- NEI[NEI$SCC %in% vehiclesSCC,]
BVN<-vehiclesNEI[vehiclesNEI$fips==24510,]
plot5<-ggplot(BVN,aes(x=factor(year),y=Emissions))+geom_bar(stat="identity")
plot5
dev.copy(png,file="Plot5.png")
dev.off()