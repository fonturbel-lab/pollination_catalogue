##This short script will help you getting hands-on with the database
##and obtain basic information from the data file

#Loading the database

data<-read.csv("pollination_catalogue.csv", header=T, sep=";")
attach(data)
names(data)

#Different papers used
refs<-unique(data$reference)
refs
length(refs)

##PLANTS
#Species covered
speciesP<-unique(data$scientificNamePlants)
speciesP
length(speciesP)

#Genera covered
generaP<-unique(data$genusPlants)
generaP
length(generaP)

#Families covered
familiesP<-unique(data$familyPlants)
familiesP
length(familiesP)

##ANIMALS
#Species covered
speciesA<-unique(data$scientificNameAnimals)
speciesA
length(speciesA)

#Genera covered
generaA<-unique(data$genusAnimals)
generaA
length(generaA)

#Families covered
familiesP<-unique(data$familyAnimals)
familiesP
length(familiesP)

#Orders covered
orders<-unique(data$orderAnimals)
orders
length(orders)

detach(data)