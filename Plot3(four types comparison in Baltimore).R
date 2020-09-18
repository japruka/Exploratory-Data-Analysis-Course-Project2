library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
SCC_names <- readRDS("Source_Classification_Code.rds")
Br<-which(NEI$fips==24510)
Bal<-NEI[Br,]
g<-group_by(Bal,year,type)
s<-summarise(g,total_emissions=sum(Emissions))
df<-data.frame(s)
plot3<-ggplot(df,aes(x=year,y=total_emissions,color=type))+geom_point()
plot3<-plot3+geom_hline(yintercept = df[4,3],size=0.5,linetype=2,colour="purple")
plot3
dev.copy(png,file="Plot3.png")
dev.off()