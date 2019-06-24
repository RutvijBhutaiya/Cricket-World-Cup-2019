<p align="center"><img width=13.5% src=https://user-images.githubusercontent.com/44467789/59976884-18a61680-95e8-11e9-9c65-98fe0c384a61.png>
  
  <p align="center"><img width=40% src=https://user-images.githubusercontent.com/44467789/59974831-2484df00-95ce-11e9-8562-ab311b53da92.gif>
    
 <br>
 
## How To Use The Project 

<details>

<summary><b>Expand For Steps</b></summary>

<br>

__Step 1:__ [Install R Studio](https://www.rstudio.com/products/rstudio/download/#download)

__Step 2:__ Download ODI Matches - [Data](http://www.howstat.com/cricket/Statistics/Matches/MatchListMenu.asp?r=T#tests?data-scroll=false)

__Step 3:__ Clean Data and Get [Format](https://github.com/RutvijBhutaiya/Cricket-World-Cup-2019/blob/master/WC_Train.csv) ready

__Step 4:__ [Clone/Download](https://github.com/RutvijBhutaiya/Cricket-World-Cup-2019.git) the Repository 

__Step 5:__ Make necessary changes [e.g add new matches data in [WC_Train.csv](https://github.com/RutvijBhutaiya/Cricket-World-Cup-2019/blob/master/WC_Train.csv) file]

__Step 6:__ Do necessary data analysis [EDA](https://github.com/RutvijBhutaiya/Cricket-World-Cup-2019/blob/master/EDA%20ICC%20Cricket.R)

__Step 7:__ Run [Random Forest Model](https://github.com/RutvijBhutaiya/Cricket-World-Cup-2019/blob/master/RF%20WC%20Final.R)

__Step 8:__ Store Results in [Random Forest Prediction.csv](https://github.com/RutvijBhutaiya/Cricket-World-Cup-2019/blob/master/Random%20Forest%20Prediction.csv)

__Step 9:__ Run [Logistic Regression Model](https://github.com/RutvijBhutaiya/Cricket-World-Cup-2019/blob/master/LOGISTIC%20REG%20WC%202019.R)

__Sept 10:__ Store Results in [Logistic Regression Prediction.csv](https://github.com/RutvijBhutaiya/Cricket-World-Cup-2019/blob/master/Logistic%20Regression%20Prediction.csv)

__Step 11:__ Run [Compare Model Predict](https://github.com/RutvijBhutaiya/Cricket-World-Cup-2019/blob/master/Compare%20Model%20Predict.R)

__Step 12:__ Store Models vs Actual Results in [Comapre Predict - RF vs. LR](https://github.com/RutvijBhutaiya/Cricket-World-Cup-2019/blob/master/Compare%20Predict%20-%20RF%20vs.%20LR.csv)

</details>
    
## Table of Content 
- [Objective](#objective)
- [Approach](#approach)
- [Data Collection](#data-collection)
- [Data Cleaning](#data-cleaning)
- [Exploratory Data Analysis](#Exploratory-Data-Analysis) 
- [Build Random Forest Model](#build-random-forest-model)
- [Random Forest Results](#random-forest-results)
- [Build Logistic regression Model](#build-logistic-regression-model)
- [Logistic Regression Results](#logistic-regression-results)
- [Compare Model Performance](#compare-model-performance)
- [LICENSE](#LICENSE)
- [Acknowledge](#Acknowledge)

<br>

<p align="center"><img width=62% src=https://user-images.githubusercontent.com/44467789/59974999-a970f800-95d0-11e9-8676-5e32213e2818.png>
    
<br>    
    
## Objective
To Predict ICC World Cup 2019 Cricket Matches, based on Team’s individual past performances.

<br>

## Approach

- Collect data from – [Link](http://www.howstat.com/cricket/Statistics/Matches/MatchListMenu.asp?r=T#tests?data-scroll=false)
-	Data Cleaning and Data Normalization
-	Exploratory Data Analysis [Link - Repository](https://github.com/RutvijBhutaiya/Cricket-World-Cup-2019/blob/master/EDA%20ICC%20Cricket.R)
-	Build Random Forest Model [Link - Repository](https://github.com/RutvijBhutaiya/Cricket-World-Cup-2019/blob/master/RF%20WC%20Final.R)
-	Performance of RF model & Results [Link - Repository](https://github.com/RutvijBhutaiya/Cricket-World-Cup-2019/blob/master/Random%20Forest%20Prediction.csv)
-	Build Logistic Regression Model [Link - Repository](https://github.com/RutvijBhutaiya/Cricket-World-Cup-2019/blob/master/LOGISTIC%20REG%20WC%202019.R)
-	Performance of LR model & Results [Link - Repository](https://github.com/RutvijBhutaiya/Cricket-World-Cup-2019/blob/master/Logistic%20Regression%20Prediction.csv)
-	Compare Models performance vs. Actual Match Results [Results](https://github.com/RutvijBhutaiya/Cricket-World-Cup-2019/blob/master/Compare%20Predict%20-%20RF%20vs.%20LR.csv)

<br>

## Data Collection 

In this study, our approach is to predict ICC WC 2019 matches based on past ODI matches results. Now, stronger teams like Australia, India, New Zealand etc would perform better and weaker teams like Pakistan, West Indies would perish – we are not saying this – but our past ODI matches data study reveales the strong and weak team contender for World Cup 2019. 

Hence, we decided to study past ODI matches since 2007 to 2018. To collect dataset, we followed [HowStats](http://www.howstat.com/cricket/home.asp)

For data collection, we extract, ODI matches year on year [since 1987] and stored the dataset in excel sheets. However, for our study we considered only ODI matched played from 2007 to 2018. Because, we believe very old matches results [like early 1990s] should not have significant impact on team wise performance for 2019 WC. Hence, we decided to study latest team wise performances.

<br>

## Data Cleaning

After extracting data from [Howstats](http://www.howstat.com/cricket/home.asp), we stored datasets in excel file sheets – year wise. 

For cleaning purpose, we used ‘Test to Colum’ function very frequently [Basically we used few excel function to clean entire dataset]

NOTE: Due to lake of data for Afghanistan team matches, we decided to exclude team Afghanistan from the study. [If we would had considered Afghanistan team for WC 2019 world cup prediction study, probably model would have shown team Afghanistan is losing every match – and could become biased!]


<br>

## Exploratory Data Analysis

For the WC 2019 cricket matches prediction study we decided to count data from 2007 to 2018. However, in many studies we found that more data make model better, True! But, for the objective of the study, we limited ourselves for number of observations. Because for particular study we feel – early 1990s team performance (Especially players which plays significant impact towards winning/loosing particular match.) Like West Indies was star performing team, but in a last decade and longer, the team is barley able to give consistence winning. 

We also assume, higher the number of matches team plays, higher the ODI experience and this leads to overall performance of the team.  

For the training dataset, we choose 983 observations, where most of the variables are factors.

```
> dim(ws)   ## Dimension of dataset
> str(ws)   ## Structure of dataset
```
And hence, before building supervised learning model we converted factors into dummy variables. 
Based on rpivotTable(wc)  function, we found interesting study.

<p align="center"><img width=75% src=https://user-images.githubusercontent.com/44467789/59975567-f657cd00-95d6-11e9-9e58-a08dfc6b95c2.png>
  
As we can see based on the above chart table, since last 2 years (2017 & 2018) – England team & India Team gave winning performance and are trending at the top positions. 

Similarly, you can see the 2011 World Cup final match was between India and Sri Lanka. In these cluster of years Australia was top contender for finals, but how come Sri Lanka reached to the finals! This is because India knockouts Australia in 2nd Quarter Finals. And Sri Lanka faced New Zealand in Semi Finals – and Sri Lanka won by 5 wickets. 

Similarly, in World Cup 2015, based on the following bar chart, we can see how New Zealand has emerged from 2012 to 2014 and challenged Australia in 2015 WC finals.

<p align="center"><img width=75% src=https://user-images.githubusercontent.com/44467789/59975590-3e76ef80-95d7-11e9-9a82-283d0bbb08f1.png>

In World Cup 2019, strong contender for world cup are India, England, New Zealand and South Africa. 

<br>

## Build Random Forest Model

Successfully uploaded dataset in R, and we created train variable for 2007 to 2018 cricket matches.
``` 
wc = read.csv('WC_Train.csv')

## Data From 2007 World Cup till 2018 Cricket Matches

train = wc[which(wc$Year >= 2007 & wc$Year <=2018),]
```
For supervised learning technique RF, we created Team A & Team B’s category variables into dummy variables.
```
## Creat dummy variable sfor Team A and Team B TRAIN

Team.A.matrix = model.matrix(~ Trim.Team.A - 1, data = train)
train = data.frame(train, Team.A.matrix)

Team.B.matrix = model.matrix(~ Trim.Team.B - 1, data = train)
train = data.frame(train, Team.B.matrix)
```
As discussed earlier, in the study Target variable is Team.A.Won, which is counts of Team A level team winning particular match – as count ‘1’ and Team A lost particular match – as count ‘0’. Here, count ‘0’ means Team B team won particular match. 
And, hence with library function randomForest() we build random forest model for train dataset. 
After tuning the model, we predicted results in ‘class’ type and ‘prob’ type.

```
print(wc.rf.tune)

test1$Team.A.Win = predict(wc.rf.tune, test1, type = 'class')
test1$Team.A.Score = predict(wc.rf.tune, test1, type = 'prob')
```
And results ae stored in [Random Forest Prediction.csv](https://github.com/RutvijBhutaiya/Cricket-World-Cup-2019/blob/master/Random%20Forest%20Prediction.csv) file

<br>

## Random Forest Results

Due to high error rate in random Forest model - [And even after tuning the model, we were not able to reduce the error]

<p align="center"><img width=75% src=https://user-images.githubusercontent.com/44467789/59975649-1d62ce80-95d8-11e9-8788-9efe1628e4a3.png>

Based on the results we were not fully satisfied. And hence decided to work on supervised learning technique Logistic Regression to predict ICC Cricket 2019 World Cup matches. 

<br>

## Build Logistic Regression Model

Similarly, for Logistic Regression we created a train dataset for ODI matches from 2007 to 2018, and created dummy variables to Target Team.A.Won variable with all the independent variables. 
```
logit = Team.A.Won ~ .  # Few Variables arenot significant, However, due to Teams we decided to consider All variables. 

logit.plot = glm(logit, data = train, family = binomial)

summary(logit.plot)
```
However, we also found few dummy variables for independent variables set are not significant for the study [like Bangladesh and West Indies]. And Finally, we decided to consider all the teams dummy variables for the study.

<p align="center"><img width=65% src=https://user-images.githubusercontent.com/44467789/59975887-20ab8980-95db-11e9-86d2-3ad38b9691e0.png>

Based on the model logit.plot we predicted the test1 file matched for 2019 World Cup. And stored the results in [Logistic Regression Prediction.csv](https://github.com/RutvijBhutaiya/Cricket-World-Cup-2019/blob/master/Logistic%20Regression%20Prediction.csv) file. 
We also did evaluation of the Logistic Regression model. However, we believe correct evaluation of the model is actual match result. 

<br>

## Logistic Regression Results

To evalute the model we ploted ROC curve and calculated the accuracy for the predicted results.
```
## Model Evaluation 

m3.matrix = confusion.matrix(test1$Team.A.Win, predict.logit, threshold = 0.5)
m3.matrix

library(pROC)
m3.roc = roc(test1$Team.A.Win, predict.logit)
m3.roc
plot(m3.roc)

## ON RESULT RATIOS DATA SET
accuracy.logit<-sum(diag(m3.matrix))/sum(m3.matrix)
accuracy.logit
[1] 0.7567568 
```

As shown model accuracy is 75%, and following are the predicted results from the WC 2019 matches. 

 <p align="center"><img width=90% src=https://user-images.githubusercontent.com/44467789/59976182-674eb300-95de-11e9-92bf-82599af839e0.png>

<br>

## Compare Model Performance

Based on the two supervised learning techniques we build model which can predict WC 2019 matched outcome even before actual match starts. And we compared the model results vs. actual matches result.  

Hence, we uploaded both the models RF and LR results in -- > [Compare Predict - RF vs. LR](https://github.com/RutvijBhutaiya/Cricket-World-Cup-2019/blob/master/Compare%20Predict%20-%20RF%20vs.%20LR.csv)

```
colnames(ComparePredict)[colnames(ComparePredict) == 'Team.A.Win'] = 'RF Team.A.Win'
colnames(ComparePredict)[colnames(ComparePredict) == 'Team.A.Win.1'] = 'LR Team.A.Win'

colnames(ComparePredict)[colnames(ComparePredict) == 'Team.A.Score.1'] = 'Prob % RF Team.A.Win'
colnames(ComparePredict)[colnames(ComparePredict) == 'predict.logit'] = 'Prob % LR Team.A.Win'
```

In the same [.csv](https://github.com/RutvijBhutaiya/Cricket-World-Cup-2019/blob/master/Compare%20Predict%20-%20RF%20vs.%20LR.csv) file we also manually entered actual match result.

#### Till Date (22/06/2019)

- __RF Predicted 14 correct matches out of 20__
- __LR Predicted 14 correct matched out of 20__

Note: __Afghanistan team matches and Match abandoned due to rain__ are not included in the result score. 


However, few matches were very close call, e.g. in terms of % probability of winning for the team. 

<p align="center"><img width=90% src=https://user-images.githubusercontent.com/44467789/59976603-759fcd80-95e4-11e9-83fe-b3d9e915e2ea.png>
                  
<p align="center"><img width=90% src=https://user-images.githubusercontent.com/44467789/59976608-881a0700-95e4-11e9-88b5-c0c5a4bdf533.png>
                     
<p align="center"><img width=90% src=https://user-images.githubusercontent.com/44467789/59976611-99fbaa00-95e4-11e9-89cf-f719213b0fc5.png>


<br>

## LICENSE 

This Project/Repository is Licensed under [MIT license.](https://github.com/RutvijBhutaiya/Cricket-World-Cup-2019/blob/master/LICENSE) 

<br>

## Acknowledge 

This Project/Repository is part of Great Learning - Cricket World Cup Challenge. 



