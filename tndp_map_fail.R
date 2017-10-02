

dnc_support<-runif(10000,0,100)
turnout<-runif(10000,0,100)


getwd()
setwd("M:/")
#install.packages("tidyverse")
#install.packages("ggplot2")
#install.packages("DBI")
#install.packages("dplyr")
#install.packages("data.table")
#install.packages("maps")
library(maps)
library(data.table)
library(tidyverse)
library(dplyr)
library(DBI)
library(ggplot2)


#states <- map_data("state")
#var <- data.frame(table(states$region))
#states$variable <- var$Freq[match(states$region,var$Var1)]
#map <- ggplot(states, aes(x=long, y=lat,fill=variable,group=group)) + geom_polygon()
#map + scale_fill_gradient(low='white', high='grey20')

# https://stackoverflow.com/questions/23714052/ggplot-mapping-us-counties-problems-with-visualization-shapes-in-r
# https://stackoverflow.com/questions/12229969/specifying-the-colour-scale-for-maps-in-ggplot

#create tennessee map data
tennessee_map_data2<-map_data("county", "tennessee")
#View(tennessee_map_data2)

countyframe<-unique(tennessee_map_data$subregion)
length(countyframe)
countycount<-1:95

county_data<-data.frame(countyframe,countycount)

tennessee_map_data2$variable <- county_data$countycount[match(tennessee_map_data2$subregion,county_data$countyframe)]

# format data 
str(data)
tennessee_donor_data<-data.frame(long=data$longitude,lat=data$latitude,group=data$dst)
str(tennessee_donor_data)

#create the tennessee map
tennessee_map2<-ggplot(tennessee_map_data2,aes(x=long,y=lat,fill=variable,group=group)) +
  geom_polygon(color="black") +
  coord_fixed(ratio=1.2) +
  scale_fill_gradient(low='white', high='green')
#geom_text(data=colleges_data_map,aes(x=long+.5,y=lat+.25,label=school_name), size=4, hjust=0, colour="orange")

tennessee_map2 