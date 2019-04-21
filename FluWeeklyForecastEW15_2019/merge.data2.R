Region.name <- 
structure(c(2L, 3L, 4L, 5L, 6L, 7L, 8L, 9L, 10L, 11L, 12L, 13L, 
14L, 15L, 16L, 17L, 18L, 19L, 20L, 21L, 22L, 23L, 24L, 25L, 26L, 
27L, 28L, 29L, 30L, 31L, 32L, 33L, 34L, 36L, 37L, 38L, 39L, 40L, 
41L, 44L, 45L, 46L, 47L, 48L, 49L, 50L, 52L, 53L, 54L, 55L, 56L, 
35L, 51L, 42L), .Label = c("", "Alabama", "Alaska", "Arizona", 
"Arkansas", "California", "Colorado", "Connecticut", "Delaware", 
"District of Columbia", "Florida", "Georgia", "Hawaii", "Idaho", 
"Illinois", "Indiana", "Iowa", "Kansas", "Kentucky", "Louisiana", 
"Maine", "Maryland", "Massachusetts", "Michigan", "Minnesota", 
"Mississippi", "Missouri", "Montana", "Nebraska", "Nevada", "New Hampshire", 
"New Jersey", "New Mexico", "New York", "New York City", "North Carolina", 
"North Dakota", "Ohio", "Oklahoma", "Oregon", "Pennsylvania", 
"Puerto Rico", "REGION", "Rhode Island", "South Carolina", "South Dakota", 
"Tennessee", "Texas", "Utah", "Vermont", "Virgin Islands", "Virginia", 
"Washington", "West Virginia", "Wisconsin", "Wyoming"), class = "factor")
Region.name <- as.character(Region.name)
#Region.name <- Region.name[-c(10, 19, 53)]
Region.name <- Region.name[-c(10)]


system("ls ./plots/fore*.png")

#system("convert ./plots/forecastNational.png  ./plots/forecastCA.png ./plots/forecastHHS1.png  ./plots/forecastHHS2.png  ./plots/forecastHHS3.png  ./plots/forecastHHS4.png  ./plots/forecastHHS5.png  ./plots/forecastHHS6.png  ./plots/forecastHHS7.png  ./plots/forecastHHS8.png  ./plots/forecastHHS9.png  ./plots/forecastHHS10.png -append ./forecast1-4wk.png")


system("convert ./plots/forecastNational.png ./plots/forecastHHS*.png ./plots/forecastState*.png -append ./forecast1-4wk.png")

#system("convert forecast1-4wk-v1.png forecast1-4wk-v2.png forecast1-4wk-v3.png forecast1-4wk-v4.png +append forecast1-4wk-all.png")


system("ls ./output/nati*.csv",intern=T)

system("cat ./output/national.onset.wk.csv | tail -n +1 > ./output/nation.all.csv")
system("cat ./output/national.pk.wk.csv | tail -n +2 >> ./output/nation.all.csv")
system("cat ./output/national.pk.prev.csv | tail -n +2 >> ./output/nation.all.csv")
system("cat ./output/national4wksSMOOTH.csv | tail -n +2 >> ./output/nation.all.csv")

system("ls ./output/ca*.csv",intern=T)

system("cat ./output/ca.onset.wk.csv | tail -n +1 > ./output/ca.all.csv")
system("cat ./output/ca.pk.wk.csv | tail -n +2 >> ./output/ca.all.csv")
system("cat ./output/ca.pk.prev.csv | tail -n +2 >> ./output/ca.all.csv")
system("cat ./output/ca4wksSMOOTH.csv | tail -n +2 >> ./output/ca.all.csv")

system("ls ./output/Region*.csv",intern=T)

system("cat ./output/Region1.onset.wk.csv | tail -n +1 > ./output/R1.all.csv")
system("cat ./output/Region1.pk.wk.csv | tail -n +2 >> ./output/R1.all.csv")
system("cat ./output/Region1.pk.prev.csv | tail -n +2 >> ./output/R1.all.csv")
system("cat ./output/Region14wksSMOOTH.csv | tail -n +2 >> ./output/R1.all.csv")

system("cat ./output/Region2.onset.wk.csv | tail -n +1 > ./output/R2.all.csv")
system("cat ./output/Region2.pk.wk.csv | tail -n +2 >> ./output/R2.all.csv")
system("cat ./output/Region2.pk.prev.csv | tail -n +2 >> ./output/R2.all.csv")
system("cat ./output/Region24wksSMOOTH.csv | tail -n +2 >> ./output/R2.all.csv")

system("cat ./output/Region3.onset.wk.csv | tail -n +1 > ./output/R3.all.csv")
system("cat ./output/Region3.pk.wk.csv | tail -n +2 >> ./output/R3.all.csv")
system("cat ./output/Region3.pk.prev.csv | tail -n +2 >> ./output/R3.all.csv")
system("cat ./output/Region34wksSMOOTH.csv | tail -n +2 >> ./output/R3.all.csv")

system("cat ./output/Region4.onset.wk.csv | tail -n +1 > ./output/R4.all.csv")
system("cat ./output/Region4.pk.wk.csv | tail -n +2 >> ./output/R4.all.csv")
system("cat ./output/Region4.pk.prev.csv | tail -n +2 >> ./output/R4.all.csv")
system("cat ./output/Region44wksSMOOTH.csv | tail -n +2 >> ./output/R4.all.csv")

system("cat ./output/Region5.onset.wk.csv | tail -n +1 > ./output/R5.all.csv")
system("cat ./output/Region5.pk.wk.csv | tail -n +2 >> ./output/R5.all.csv")
system("cat ./output/Region5.pk.prev.csv | tail -n +2 >> ./output/R5.all.csv") 
system("cat ./output/Region54wksSMOOTH.csv | tail -n +2 >> ./output/R5.all.csv")

system("cat ./output/Region6.onset.wk.csv | tail -n +1 > ./output/R6.all.csv")
system("cat ./output/Region6.pk.wk.csv | tail -n +2 >> ./output/R6.all.csv")
system("cat ./output/Region6.pk.prev.csv | tail -n +2 >> ./output/R6.all.csv") 
system("cat ./output/Region64wksSMOOTH.csv | tail -n +2 >> ./output/R6.all.csv")

system("cat ./output/Region7.onset.wk.csv | tail -n +1 > ./output/R7.all.csv")
system("cat ./output/Region7.pk.wk.csv | tail -n +2 >> ./output/R7.all.csv")
system("cat ./output/Region7.pk.prev.csv | tail -n +2 >> ./output/R7.all.csv") 
system("cat ./output/Region74wksSMOOTH.csv | tail -n +2 >> ./output/R7.all.csv")

system("cat ./output/Region8.onset.wk.csv | tail -n +1 > ./output/R8.all.csv")
system("cat ./output/Region8.pk.wk.csv | tail -n +2 >> ./output/R8.all.csv")
system("cat ./output/Region8.pk.prev.csv | tail -n +2 >> ./output/R8.all.csv") 
system("cat ./output/Region84wksSMOOTH.csv | tail -n +2 >> ./output/R8.all.csv")

system("cat ./output/Region9.onset.wk.csv | tail -n +1 > ./output/R9.all.csv")
system("cat ./output/Region9.pk.wk.csv | tail -n +2 >> ./output/R9.all.csv")
system("cat ./output/Region9.pk.prev.csv | tail -n +2 >> ./output/R9.all.csv") 
system("cat ./output/Region94wksSMOOTH.csv | tail -n +2 >> ./output/R9.all.csv")

system("cat ./output/Region10.onset.wk.csv | tail -n +1 > ./output/R10.all.csv")
system("cat ./output/Region10.pk.wk.csv | tail -n +2 >> ./output/R10.all.csv")
system("cat ./output/Region10.pk.prev.csv | tail -n +2 >> ./output/R10.all.csv") 
system("cat ./output/Region104wksSMOOTH.csv | tail -n +2 >> ./output/R10.all.csv")

system("ls ./output/*all.csv")

###### Nation and 10 Region
system("cat ./output/nation.all.csv | tail -n +1 > ./output/all.csv")
system("cat ./output/R1.all.csv | tail -n +2 >> ./output/all.csv")
system("cat ./output/R2.all.csv | tail -n +2 >> ./output/all.csv")
system("cat ./output/R3.all.csv | tail -n +2 >> ./output/all.csv")
system("cat ./output/R4.all.csv | tail -n +2 >> ./output/all.csv")
system("cat ./output/R5.all.csv | tail -n +2 >> ./output/all.csv")
system("cat ./output/R6.all.csv | tail -n +2 >> ./output/all.csv")
system("cat ./output/R7.all.csv | tail -n +2 >> ./output/all.csv")
system("cat ./output/R8.all.csv | tail -n +2 >> ./output/all.csv")
system("cat ./output/R9.all.csv | tail -n +2 >> ./output/all.csv")
system("cat ./output/R10.all.csv | tail -n +2 >> ./output/all.csv")


###### CA
system("cat ./output/ca.all.csv | tail -n +1 > ./output/all.ca.csv")

###### 53 States
states.output <- system("ls ./output/State*4wksSMOOTH.csv",intern=T)
for (k in 1:length(states.output)){
    system(paste("cat ./output/State",k,".onset.wk.csv | tail -n +1 > ./output/State",k,".all.csv", sep=""))
    system(paste("cat ./output/State",k,".pk.wk.csv | tail -n +2 >> ./output/State",k,".all.csv", sep=""))
    system(paste("cat ./output/State",k,".pk.prev.csv | tail -n +2 >> ./output/State",k,".all.csv", sep=""))
    system(paste("cat ./output/State",k,"4wksSMOOTH.csv | tail -n +2 >> ./output/State",k,".all.csv", sep=""))
}

all.states.output <- system("ls ./output/State*.all.csv", intern=T)
system("cat ./output/State1.all.csv | tail -n +1 > ./output/all.state.csv")
for(k in 2:length(all.states.output)){
    system(paste("cat ./output/State",k,".all.csv | tail -n +2 >> ./output/all.state.csv", sep=""))
}


#### rename output files
system("cp ./output/all.csv ./EW15-UCSF1-2019-04-22.csv")
system("cp ./output/all.ca.csv ./EW15-UCSF1-CA-2019-04-22.csv")
system("cp ./output/all.state.csv ./EW15-UCSF1-States-2019-04-22.csv")

system("wc -l  EW15-UCSF1-2019-04-22.csv")
system("wc -l  EW15-UCSF1-CA-2019-04-22.csv")
system("wc -l  EW15-UCSF1-States-2019-04-22.csv")
system("cp  EW15-UCSF1-2019-04-22.csv EW15-UCSF1-CA-2019-04-22.csv EW15-UCSF1-States-2019-04-22.csv forecast1-4wk.png ./submit")

