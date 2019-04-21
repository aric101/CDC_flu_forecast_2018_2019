cp EW15-UCSF1-2019-04-22.csv EW15-TeamAnonymous-2019-04-22.csv
cp EW15-UCSF1-States-2019-04-22.csv EW15-TeamAnonymous-States-2019-04-22.csv
sed '/Season onset/d' ./EW15-TeamAnonymous-States-2019-04-22.csv > ./V2_EW15-TeamAnonymous-States-2019-04-22.csv 
