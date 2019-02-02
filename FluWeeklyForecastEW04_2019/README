#### 2017-2018 Flu Forecasts:
#### Project 1: FluSight 2017-18 Seasonal Influenza Forecasting (National + 10 Regions)
#### Project 2: State FluSight 2017-18 Seasonal Seasonal Influenza Forecasting for US States (California)
#### Details: https://predict.phiresearchlab.org/
#### Weekly forecasts Submission: https://predict.phiresearchlab.org/
#### Weekly updated flu data: https://gis.cdc.gov/grasp/fluview/fluportaldashboard.html
####
├── run.sh		#### run R code 
├── submit		#### 2 csv files to submit to CDC website: 1) National+Regional, 2) California
│   ├── EW17-UCSF1-2017-10-29.csv  	 #### 1) National+Regional
│   ├── EW17-UCSF1-CA-2017-10-29.csv	 #### 2) California
│   └── forecast1-4wk.png		 #### plots of 1-4 wk prev: national, ca, and 10 regions
├── data		#### input files
│   ├── ILINetCA.csv	#### California data
│   ├── ILINet.csv	#### National data
│   ├── ILINetHHS.csv	#### Regional data
│   ├── national1-4wk.forecast.template.csv	#### template of 1-4 wk prev
│   ├── national.onset.wk.forecast.template.csv	#### template of onset wk
│   ├── national.pk.prev.forecast.template.csv	#### template of preak prev
│   ├── national.pk.wk.forecast.template.csv	#### template of preak wk
│   ├── original 	#### original data: https://gis.cdc.gov/grasp/fluview/fluportaldashboard.html
│   │   ├── california
│   │   │   └── dataEW42
│   │   │       ├── FluViewPhase2Data (3).zip
│   │   │       ├── ILINet.csv
│   │   │       ├── WHO_NREVSS_Clinical_Labs.csv
│   │   │       ├── WHO_NREVSS_Combined_prior_to_2015_16.csv
│   │   │       └── WHO_NREVSS_Public_Health_Labs.csv
│   │   ├── nation
│   │   │   ├── dataEW41
│   │   │   │   ├── FluViewPhase2Data (1).zip
│   │   │   │   ├── ILINet.csv
│   │   │   │   ├── WHO_NREVSS_Clinical_Labs.csv
│   │   │   │   ├── WHO_NREVSS_Combined_prior_to_2015_16.csv
│   │   │   │   └── WHO_NREVSS_Public_Health_Labs.csv
│   │   │   └── dataEW42
│   │   │       ├── FluViewPhase2Data (5).zip
│   │   │       ├── ILINet.csv
│   │   │       ├── WHO_NREVSS_Clinical_Labs.csv
│   │   │       ├── WHO_NREVSS_Combined_prior_to_2015_16.csv
│   │   │       └── WHO_NREVSS_Public_Health_Labs.csv
│   │   └── region
│   │       └── dataEW42
│   │           ├── FluViewPhase2Data (2).zip
│   │           ├── ILINet.csv
│   │           ├── WHO_NREVSS_Clinical_Labs.csv
│   │           ├── WHO_NREVSS_Combined_prior_to_2015_16.csv
│   │           └── WHO_NREVSS_Public_Health_Labs.csv
│   └── wILI_Baseline.csv
├── merge.data2.R	#### generate the final csv files
├── EW17-UCSF1-2017-10-29.csv
├── EW17-UCSF1-CA-2017-10-29.csv
├── EW17-UCSF1-CA.2017-10-29.csv
├── forecast1-4wk.png
├── LR1.CA.R		#### onset wk CA
├── LR1.HHS.R		#### onset wk 10 regions
├── LR1.R		#### onset wk national
├── LR2.CA.R		#### peak wk CA
├── LR2.HHS.R		#### peak wk 10 regions
├── LR2.R		#### peak wk national
├── LR3.CA.R		#### peak prev CA
├── LR3.HHS.R		#### peak prev 10 regions
├── LR3.R		#### peak prev national
├── LR4.CA.R		#### 1-4 wks ahead CA
├── LR4.HHS.R		#### 1-4 wks ahead 10 regions
├── LR4.R		#### 1-4 wks ahead national
├── national1-4wk.forecast.template.csv
├── national4wks.csv
├── national.onset.wk.forecast.template.csv
├── national.pk.prev.forecast.template.csv
├── national.pk.wk.forecast.template.csv
├── output		#### output csv files
│   ├── ca4wks.csv
│   ├── ca4wksSMOOTH.csv
│   ├── ca.onset.wk.csv
│   ├── ca.pk.prev.csv
│   ├── ca.pk.wk.csv
│   ├── national4wksSMOOTH.csv
│   ├── national.onset.wk.csv
│   ├── national.pk.prev.csv
│   ├── national.pk.wk.csv
│   ├── Region104wksSMOOTH.csv
│   ├── Region10.onset.wk.csv
│   ├── Region10.pk.prev.csv
│   ├── Region10.pk.wk.csv
│   ├── Region14wksSMOOTH.csv
│   ├── Region1.onset.wk.csv
│   ├── Region1.pk.prev.csv
│   ├── Region1.pk.wk.csv
│   ├── Region24wksSMOOTH.csv
│   ├── Region2.onset.wk.csv
│   ├── Region2.pk.prev.csv
│   ├── Region2.pk.wk.csv
│   ├── Region34wksSMOOTH.csv
│   ├── Region3.onset.wk.csv
│   ├── Region3.pk.prev.csv
│   ├── Region3.pk.wk.csv
│   ├── Region44wksSMOOTH.csv
│   ├── Region4.onset.wk.csv
│   ├── Region4.pk.prev.csv
│   ├── Region4.pk.wk.csv
│   ├── Region54wksSMOOTH.csv
│   ├── Region5.onset.wk.csv
│   ├── Region5.pk.prev.csv
│   ├── Region5.pk.wk.csv
│   ├── Region64wksSMOOTH.csv
│   ├── Region6.onset.wk.csv
│   ├── Region6.pk.prev.csv
│   ├── Region6.pk.wk.csv
│   ├── Region74wksSMOOTH.csv
│   ├── Region7.onset.wk.csv
│   ├── Region7.pk.prev.csv
│   ├── Region7.pk.wk.csv
│   ├── Region84wksSMOOTH.csv
│   ├── Region8.onset.wk.csv
│   ├── Region8.pk.prev.csv
│   ├── Region8.pk.wk.csv
│   ├── Region94wksSMOOTH.csv
│   ├── Region9.onset.wk.csv
│   ├── Region9.pk.prev.csv
│   └── Region9.pk.wk.csv
├── plots		#### output plots
│   ├── CA 1-4 week forecast.png
│   ├── CA onset wk forecast.png
│   ├── CA pk prev forecast.png
│   ├── CA pk wk forecast.png
│   ├── forecastCA.png
│   ├── forecastHHS10.png
│   ├── forecastHHS1.png
│   ├── forecastHHS2.png
│   ├── forecastHHS3.png
│   ├── forecastHHS4.png
│   ├── forecastHHS5.png
│   ├── forecastHHS6.png
│   ├── forecastHHS7.png
│   ├── forecastHHS8.png
│   ├── forecastHHS9.png
│   ├── forecastNational.png
│   ├── national 1-4 week forecast.png
│   ├── national onset wk forecast.png
│   ├── national pk prev forecast.png
│   ├── national pk wk forecast.png
│   ├── Region101-4 week forecast.png
│   ├── Region 10 onset.wk.forecast.png 
│   ├── Region10pk prev forecast.png
│   ├── Region10pk.wk.forecast.png
│   ├── Region11-4 week forecast.png
│   ├── Region 1 onset.wk.forecast.png 
│   ├── Region1pk prev forecast.png
│   ├── Region1pk.wk.forecast.png
│   ├── Region21-4 week forecast.png
│   ├── Region 2 onset.wk.forecast.png 
│   ├── Region2pk prev forecast.png
│   ├── Region2pk.wk.forecast.png
│   ├── Region31-4 week forecast.png
│   ├── Region 3 onset.wk.forecast.png 
│   ├── Region3pk prev forecast.png
│   ├── Region3pk.wk.forecast.png
│   ├── Region41-4 week forecast.png
│   ├── Region 4 onset.wk.forecast.png 
│   ├── Region4pk prev forecast.png
│   ├── Region4pk.wk.forecast.png
│   ├── Region51-4 week forecast.png
│   ├── Region 5 onset.wk.forecast.png 
│   ├── Region5pk prev forecast.png
│   ├── Region5pk.wk.forecast.png
│   ├── Region61-4 week forecast.png
│   ├── Region 6 onset.wk.forecast.png 
│   ├── Region6pk prev forecast.png
│   ├── Region6pk.wk.forecast.png
│   ├── Region71-4 week forecast.png
│   ├── Region 7 onset.wk.forecast.png 
│   ├── Region7pk prev forecast.png
│   ├── Region7pk.wk.forecast.png
│   ├── Region81-4 week forecast.png
│   ├── Region 8 onset.wk.forecast.png 
│   ├── Region8pk prev forecast.png
│   ├── Region8pk.wk.forecast.png
│   ├── Region91-4 week forecast.png
│   ├── Region 9 onset.wk.forecast.png 
│   ├── Region9pk prev forecast.png
│   └── Region9pk.wk.forecast.png
├── Region104wks.csv
├── Region14wks.csv
├── Region24wks.csv
├── Region34wks.csv
├── Region44wks.csv
├── Region54wks.csv
├── Region64wks.csv
├── Region74wks.csv
├── Region84wks.csv
├── Region94wks.csv
└── Rplots.pdf
