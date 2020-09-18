coal1 <- filter(SCC_names,EI.Sector=="Fuel Comb - Comm/Institutional - Coal")
coal2<- filter(SCC_names,EI.Sector=="Fuel Comb - Electric Generation - Coal")
coal3 <-filter(SCC_names,EI.Sector=="Fuel Comb - Industrial Boilers, ICEs - Coal")
coal<- rbind(coal1, coal2, coal3)
c<-coal$SCC
CoalNEI<-NEI[NEI$SCC %in% c,]
g<-group_by(CoalNEI,year)
s<-summarise(g,Emissions=sum(Emissions))
df<-data.frame(s)
plot4<-ggplot(df,aes(x=factor(year),y=log(Emissions)))+geom_bar(stat="identity")
plot4
dev.copy(png,file="Plot4.png")
dev.off()