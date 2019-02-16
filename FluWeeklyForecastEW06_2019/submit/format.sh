cp EW06-UCSF1-2019-02-18.csv EW06-TeamAnonymous-2019-02-18.csv
cp EW06-UCSF1-States-2019-02-18.csv EW06-TeamAnonymous-States-2019-02-18.csv
sed '/Season onset/d' ./EW06-TeamAnonymous-States-2019-02-18.csv > ./V2_EW06-TeamAnonymous-States-2019-02-18.csv 
