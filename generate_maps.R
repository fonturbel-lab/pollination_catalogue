##This short script will help you getting hands-on with the database
##and plot locations in a map

#Loading the database
data<-read.csv("pollination_catalogue.csv", header=T, sep=";")
attach(data)
names(data)

#Setting geographic coordinates space
min(data$decimalLatitude, na.rm = TRUE)
max(data$decimalLatitude, na.rm = TRUE)
min(data$decimalLongitude, na.rm = TRUE)
max(data$decimalLongitude, na.rm = TRUE)


#Ploting a simple map, locating the sampling points in Chile
library(maps)
library(mapdata)
library(maptools)
library(mapproj)
map(database= "world", regions = "Chile", col="darkgoldenrod1", fill=TRUE, projection="gilbert", orientation= c(90,0,270))
lon <- (data$decimalLongitude)
lat <- (data$decimalLatitude)
coord <- mapproject(lon, lat, proj="gilbert", orientation=c(90, 0, 270))  #convert points to projected lat/long
points(coord, pch=20, cex=1.2, col="red")  #plot converted points

#Getting the interactive map (it may take a while...)
library(ggplot2)
library(ggmap)
library(sp)
library(leaflet)
df <- as.data.frame(cbind(lon,lat))
df<-na.omit(df)
coordinates(df) <- ~lon+lat
prj_dd <- "+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs"

leaflet(df) %>% addMarkers() %>% addTiles()