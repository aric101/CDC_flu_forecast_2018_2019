cp EW12-UCSF1-2019-04-01.csv EW12-TeamAnonymous-2019-04-01.csv
cp EW12-UCSF1-States-2019-04-01.csv EW12-TeamAnonymous-States-2019-04-01.csv
sed '/Season onset/d' ./EW12-TeamAnonymous-States-2019-04-01.csv > ./V2_EW12-TeamAnonymous-States-2019-04-01.csv 
