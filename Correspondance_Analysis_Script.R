data<-read.csv("ExternalData.csv") #Reads is csv file.
Ho<-data$HO #Subsets habitat data.
Continent<-data$Continent #Subsets biogeographical data.
Ho.Continent<-cbind(Ho, Continent) #Creates a new object with the species identity 

require(ca) #Allows ca functions to be performed.
Ho.Continent.ca<-ca(table) #Performs a correspondence analysis.
summary(Ho.Continent.ca)

install.packages("plyr")
require(plyr)
count(Ho.Continent, c('Ho', 'Continent'))

corr_table<-read.csv("Correspondence_Table.csv")
corr_table<-corr_table[1:11,2:4]
row.names(corr_table)<-c("DF",
                         "DF/NF",
                         "DF/NF/MF",
                         "MF",
                         "N.A.",
                         "NF",
                         "RF",
                         "RF/DF",
                         "RF/MF",
                         "RF/NF",
                         "TF")	
Ho.Continent.ca<-ca(corr_table)
summary(Ho.Continent.ca)
plot(Ho.Continent.ca,mass=T,arrows=c(T,T), 
     map='rowgreen')
