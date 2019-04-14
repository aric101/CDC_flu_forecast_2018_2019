system("ls fore*.png")
system("convert forecastNational.png  forecastHHS1.png  forecastHHS2.png  forecastHHS3.png  forecastHHS4.png  forecastHHS5.png  forecastHHS6.png  forecastHHS7.png  forecastHHS8.png  forecastHHS9.png  forecastHHS10.png -append forecast1-4wk.png")

#system("convert forecast1-4wk-v1.png forecast1-4wk-v2.png forecast1-4wk-v3.png forecast1-4wk-v4.png +append forecast1-4wk-all.png")


system("ls nati*.csv",intern=T)

system("cat national.onset.wk.csv | tail -n +1 > nation.all.csv")
system("cat national.pk.wk.csv | tail -n +2 >> nation.all.csv")
system("cat national.pk.prev.csv | tail -n +2 >> nation.all.csv")
system("cat national4wks.csv | tail -n +2 >> nation.all.csv")

system("ls Region*.csv",intern=T)

system("cat Region1.onset.wk.csv | tail -n +1 > R1.all.csv")
system("cat Region1.pk.wk.csv | tail -n +2 >> R1.all.csv")
system("cat Region1.pk.prev.csv | tail -n +2 >> R1.all.csv")
system("cat Region14wks.csv | tail -n +2 >> R1.all.csv")

system("cat Region2.onset.wk.csv | tail -n +1 > R2.all.csv")
system("cat Region2.pk.wk.csv | tail -n +2 >> R2.all.csv")
system("cat Region2.pk.prev.csv | tail -n +2 >> R2.all.csv")
system("cat Region24wks.csv | tail -n +2 >> R2.all.csv")

system("cat Region3.onset.wk.csv | tail -n +1 > R3.all.csv")
system("cat Region3.pk.wk.csv | tail -n +2 >> R3.all.csv")
system("cat Region3.pk.prev.csv | tail -n +2 >> R3.all.csv")
system("cat Region34wks.csv | tail -n +2 >> R3.all.csv")

system("cat Region4.onset.wk.csv | tail -n +1 > R4.all.csv")
system("cat Region4.pk.wk.csv | tail -n +2 >> R4.all.csv")
system("cat Region4.pk.prev.csv | tail -n +2 >> R4.all.csv")
system("cat Region44wks.csv | tail -n +2 >> R4.all.csv")

system("cat Region5.onset.wk.csv | tail -n +1 > R5.all.csv")
system("cat Region5.pk.wk.csv | tail -n +2 >> R5.all.csv")
system("cat Region5.pk.prev.csv | tail -n +2 >> R5.all.csv") 
system("cat Region54wks.csv | tail -n +2 >> R5.all.csv")

system("cat Region6.onset.wk.csv | tail -n +1 > R6.all.csv")
system("cat Region6.pk.wk.csv | tail -n +2 >> R6.all.csv")
system("cat Region6.pk.prev.csv | tail -n +2 >> R6.all.csv") 
system("cat Region64wks.csv | tail -n +2 >> R6.all.csv")

system("cat Region7.onset.wk.csv | tail -n +1 > R7.all.csv")
system("cat Region7.pk.wk.csv | tail -n +2 >> R7.all.csv")
system("cat Region7.pk.prev.csv | tail -n +2 >> R7.all.csv") 
system("cat Region74wks.csv | tail -n +2 >> R7.all.csv")

system("cat Region8.onset.wk.csv | tail -n +1 > R8.all.csv")
system("cat Region8.pk.wk.csv | tail -n +2 >> R8.all.csv")
system("cat Region8.pk.prev.csv | tail -n +2 >> R8.all.csv") 
system("cat Region84wks.csv | tail -n +2 >> R8.all.csv")

system("cat Region9.onset.wk.csv | tail -n +1 > R9.all.csv")
system("cat Region9.pk.wk.csv | tail -n +2 >> R9.all.csv")
system("cat Region9.pk.prev.csv | tail -n +2 >> R9.all.csv") 
system("cat Region94wks.csv | tail -n +2 >> R9.all.csv")

system("cat Region10.onset.wk.csv | tail -n +1 > R10.all.csv")
system("cat Region10.pk.wk.csv | tail -n +2 >> R10.all.csv")
system("cat Region10.pk.prev.csv | tail -n +2 >> R10.all.csv") 
system("cat Region104wks.csv | tail -n +2 >> R10.all.csv")




system("ls *all.csv")

system("cat nation.all.csv | tail -n +1 > all.csv")
system("cat R1.all.csv | tail -n +2 >> all.csv")
system("cat R2.all.csv | tail -n +2 >> all.csv")
system("cat R3.all.csv | tail -n +2 >> all.csv")
system("cat R4.all.csv | tail -n +2 >> all.csv")
system("cat R5.all.csv | tail -n +2 >> all.csv")
system("cat R6.all.csv | tail -n +2 >> all.csv")
system("cat R7.all.csv | tail -n +2 >> all.csv")
system("cat R8.all.csv | tail -n +2 >> all.csv")
system("cat R9.all.csv | tail -n +2 >> all.csv")
system("cat R10.all.csv | tail -n +2 >> all.csv")

system("cp all.csv EW04-UCSF1-2018-02-06.csv")
system("cp all.csv EW04-TeamC-2018-02-06.csv")
system("wc -l  EW04-UCSF1-2018-02-06.csv")
