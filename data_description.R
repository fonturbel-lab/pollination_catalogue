##This short script will help you getting hands-on with the database
##and obtain basic information from the data file

#Loading the database

data<-read.csv("pollination_catalogue.csv", header=T, sep=";")
attach(data)
names(data)

#Different papers used
refs<-unique(data$dwc.reference)
refs
length(refs)

##PLANTS
#Species covered
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

##ANIMALS
#Species covered
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

detach(data)