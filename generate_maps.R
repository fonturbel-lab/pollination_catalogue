#Loading the huge database

data<-read.csv("pollination_catalogue.csv", header=T, sep=";")
attach(data)
names(data)

#Different papers used
refs<-unique(data$dwc.reference)
refs
length(refs)

  #Plant species covered
speciesP<-unique(data$dwc.scientificNamePlants)
speciesP
length(speciesP)

#Genera covered
generaP<-unique(data$dwc.genusPlants)
generaP
length(generaP)

#Families covered
familiesP<-unique(data$dwc.familyPlants)
familiesP
length(familiesP)


#Animal species covered
speciesA<-unique(data$dwc.scientificNameAnimals)
speciesA
length(speciesA)

#Genera covered
generaA<-unique(data$dwc.genusAnimals)
generaA
length(generaA)

#Families covered
familiesP<-unique(data$dwc.familyAnimals)
familiesP
length(familiesP)

#Orders covered
orders<-unique(data$dwc.orderAnimals)
orders
length(orders)


###MAPS###

#Setting geographic coordinates space
min(data$dwc.decimalLatitude, na.rm = TRUE)
max(data$dwc.decimalLatitude, na.rm = TRUE)
min(data$dwc.decimalLongitude, na.rm = TRUE)
max(data$dwc.decimalLongitude, na.rm = TRUE)

hist(data$dwc.decimalLatitude, xlim = c(-15,-55), main="", xlab="Latitude", ylab="Frequency", col="chartreuse3")

#Temporal coverage - export plots 5 x 7
barplot(table(data$EML.pubDate), xlab="Year", ylab="Frequency", main = " ", col="darkorchid2")

#Ploting a simple map, locating the sampling points in Chile
library(maps)
library(mapdata)
library(maptools)
library(mapproj)
map(database= "world", regions = "Chile", col="darkgoldenrod1", fill=TRUE, projection="gilbert", orientation= c(90,0,270))
lon <- (data$dwc.decimalLongitude)
lat <- (data$dwc.decimalLatitude)
coord <- mapproject(lon, lat, proj="gilbert", orientation=c(90, 0, 270))  #convert points to projected lat/long
points(coord, pch=20, cex=1.2, col="red")  #plot converted points

# getting the interactive map

library(ggplot2)
library(ggmap)
library(sp)
library(leaflet)
df <- as.data.frame(cbind(lon,lat))
df<-na.omit(df)
coordinates(df) <- ~lon+lat
prj_dd <- "+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs"

leaflet(df) %>% addMarkers() %>% addTiles()
