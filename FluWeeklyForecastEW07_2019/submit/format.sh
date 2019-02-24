cp EW07-UCSF1-2019-02-25.csv EW07-TeamAnonymous-2019-02-25.csv
cp EW07-UCSF1-States-2019-02-25.csv EW07-TeamAnonymous-States-2019-02-25.csv
sed '/Season onset/d' ./EW07-TeamAnonymous-States-2019-02-25.csv > ./V2_EW07-TeamAnonymous-States-2019-02-25.csv 
