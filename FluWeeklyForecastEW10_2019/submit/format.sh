cp EW09-UCSF1-2019-03-11.csv EW09-TeamAnonymous-2019-03-11.csv
cp EW09-UCSF1-States-2019-03-11.csv EW09-TeamAnonymous-States-2019-03-11.csv
sed '/Season onset/d' ./EW09-TeamAnonymous-States-2019-03-11.csv > ./V2_EW09-TeamAnonymous-States-2019-03-11.csv 
