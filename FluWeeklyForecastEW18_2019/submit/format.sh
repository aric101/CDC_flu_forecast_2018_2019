cp EW18-UCSF1-2019-05-13.csv EW18-TeamAnonymous-2019-05-13.csv
cp EW18-UCSF1-States-2019-05-13.csv EW18-TeamAnonymous-States-2019-05-13.csv
sed '/Season onset/d' ./EW18-TeamAnonymous-States-2019-05-13.csv > ./V2_EW18-TeamAnonymous-States-2019-05-13.csv 
