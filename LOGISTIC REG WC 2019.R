

## LOGISTIC REGRESSION - WORLD CUP 2019

wc = read.csv('WC_Train.csv')

## Data From 2007 World Cup till 2018 Cricket Matches

train = wc[which(wc$Year >= 2007 & wc$Year <=2018),]

#train = wc

attach(train)

## Creat dummy variable sfor Team A and Team B TRAIN

Team.A.matrix = model.matrix(~ Trim.Team.A - 1, data = train)
train = data.frame(train, Team.A.matrix)

Team.B.matrix = model.matrix(~ Trim.Team.B - 1, data = train)
train = data.frame(train, Team.B.matrix)

## Remove Year, Team A & Team B 

train = train[, -c(1,3,4,6,8,5,9)]


## Randomly Arrange Dataset

library(dplyr)

train = sample_frac(train, 1)


## TEST DATA SET

test1 = read.csv('Test_Final.csv')

Team.A.matrix.test = model.matrix(~ Trim.Team.A - 1, data = test1)
test1 = data.frame(test1, Team.A.matrix.test)

Team.B.matrix.test = model.matrix(~ Trim.Team.B - 1, data = test1)
test1 = data.frame(test1, Team.B.matrix.test)

test = test1[, -c(1,3,4,6,5,7)]

## Build Logistic Regression Model

attach(train)
library(SDMTools)

#logit = Team.A.Won ~ Trim.Team.AAustralia + Trim.Team.ABangladesh + Trim.Team.AEngland +
#  Trim.Team.ASouth.Africa + Trim.Team.ASri.Lanka + Trim.Team.BAustralia + 
#  Trim.Team.BBangladesh + Trim.Team.BIndia + Trim.Team.BPakistan + Trim.Team.BSouth.Africa

logit = Team.A.Won ~ .  # Few Variables arenot significant, However, due to Teams we decided to consider All variables. 

logit.plot = glm(logit, data = train, family = binomial)

summary(logit.plot)

test1$predict.logit = predict.glm(logit.plot, newdata = test1, type = 'response')

test1$Team.A.Win = ifelse(test1$predict.logit > 0.5,1,0)

test1 = test1[, -c(6:25)]
 
test1 = test1[, -5]   ## Remove Ground Variable - Not included in Study

View(test1)

write.csv(test1, 'Logistic Regression Prediction.csv')

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
loss.logit<-m3.matrix[1,2]/(m3.matrix[1,2]+m3.matrix[1,1])
loss.logit
opp.loss.logit<-m3.matrix[2,1]/(m3.matrix[2,1]+m3.matrix[2,2])
opp.loss.logit
tot.loss.logit<-0.95*loss.logit+0.05*opp.loss.logit
tot.loss.logit
