

## LOGISTIC REGRESSION - WORLD CUP 2019

wc = read.csv('WC_Train.csv')

train = wc

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

View(test1)

write.csv(test1, 'WC19 Predict Match.csv')

## Model Evaluation 



