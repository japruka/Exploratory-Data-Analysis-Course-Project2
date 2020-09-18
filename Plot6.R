vehicles <- grepl("vehicle", SCC_names$SCC.Level.Two, ignore.case=TRUE)
vehiclesSCC <- SCC_names[vehicles,]$SCC
vehiclesNEI <- NEI[NEI$SCC %in% vehiclesSCC,]
BVNb<-vehiclesNEI[vehiclesNEI$fips==24510,]
BVNc<-vehiclesNEI[vehiclesNEI$fips=="06037",]
BVNs<-rbind(BVNb,BVNc)
plot6<-ggplot(BVNs,aes(x=factor(year),y=Emissions))+geom_bar(stat="identity")+facet_grid(.~fips,
                                                labeller =  as_labeller(c("06037"="Los","24510"="Bal")))
plot6
dev.copy(png,file="Plot6.png")
dev.off()