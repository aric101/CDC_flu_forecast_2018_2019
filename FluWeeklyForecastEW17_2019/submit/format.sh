cp EW17-UCSF1-2019-05-06.csv EW17-TeamAnonymous-2019-05-06.csv
cp EW17-UCSF1-States-2019-05-06.csv EW17-TeamAnonymous-States-2019-05-06.csv
sed '/Season onset/d' ./EW17-TeamAnonymous-States-2019-05-06.csv > ./V2_EW17-TeamAnonymous-States-2019-05-06.csv 
