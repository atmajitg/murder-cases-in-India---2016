library(geofacet)
library(ggplot2)
library(reshape2)
setwd("")
mrder = read.csv("murder.csv", stringsAsFactors = FALSE)
colnames(mrder) <- c("state","2010","2011","2012","2013","2014","2015","2016")
mrder= melt(mrder, id.vars = "state", variable.name = "year")


ggplot(mrder, aes(year, value)) +
  facet_geo(~ state, grid  ="india_grid2") +
  scale_x_discrete(labels=c("'10","12","14","16"), breaks=c(2010,2012,2014,2016))+
    geom_col(fill = "#fa9fb5")+
  geom_hline(yintercept = 1029) +
  theme_bw()+
  theme(axis.text.x=element_text(size=8),legend.key.width=unit(2,"cm"),
                  axis.text.y=element_text(size=8),
                  legend.position="top",
                  plot.caption=element_text(hjust=0),
                  plot.subtitle=element_text(face="italic",hjust=0.5,size=10),
                  plot.title=element_text(size=18,face="bold",hjust=0.5))+
  labs(x="Year",y="Murder Cases",title="Murder cases in India by states",subtitle="National Crime Statistics of India",caption="Source: http://ncrb.gov.in/")
