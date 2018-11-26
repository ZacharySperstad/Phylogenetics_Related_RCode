require(tidyr)
require(ape)
require(phytools)
cypriniform_data<-read.csv("Ploidy_Cypriniformes.csv") #Reads in the ploidy csv file.
cypriniform_data<-unite(cypriniform_data, Genus_Species,
                        c(Genus, Species), remove=FALSE) #Combines genus and species names to make a column with "Genus_species".
cypriniform_data_wo_reference<-cypriniform_data[,1:10]
pp<-c(3:16) #Polyploid genome number. I think there is a fish with 16 sets...
dp<-2 #Diploid genome number.
mp<-1 #Monoploid genome number.
pp.taxa<-subset(cypriniform_data_wo_reference,
                cypriniform_data_wo_reference$Ploidy%in%pp) #Extracts polyploid taxa.
dp.taxa<-subset(cypriniform_data_wo_reference,
                cypriniform_data_wo_reference$Ploidy%in%dp) #Extracts diploid taxa.
mp.taxa<-subset(cypriniform_data_wo_reference,
                cypriniform_data_wo_reference$Ploidy%in%mp) #Extracts monoploid taxa.
pp.taxa$ID<-"polyploid" #Assigns polyploid as a descriptor to these taxa
dp.taxa$ID<-"diploid" #Assigns diploid as a descriptor to these taxa
mp.taxa$ID<-"monoploid" #Assigns monoploid as a descriptor to these taxa
cypriniform_data_wo_reference<-rbind(pp.taxa,dp.taxa,mp.taxa) #Combines matricies

#chronogram(phy, scale = 1, expo = 2, minEdgeLength = 1e-06) 
#Makes chronograms out of phylograms.

catostomid.tree<-read.nexus("catostomidae_chronogram_bagley.tree")
subtrees(catostomid.tree)
