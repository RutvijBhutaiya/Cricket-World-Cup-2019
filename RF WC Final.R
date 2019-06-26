
## Random Forest World Cup 1992 

wc = read.csv('WC_Train.csv')

## Data From 2007 World Cup till 2018 Cricket Matches

train = wc[which(wc$Year >= 2007 & wc$Year <=2019),]

#train = train[, -6]

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

## UPDATE AS ON 26-6-2019 
## TRAIN DATASET ALSO INCLUDED WC 19 MATCHES 
## PREDICTING WC 2019 AFTER 25TH JUNE 2019 MATCHES

test1 = test1[-c(1:25),]  

Team.A.matrix.test = model.matrix(~ Trim.Team.A - 1, data = test1)
test1 = data.frame(test1, Team.A.matrix.test)

Team.B.matrix.test = model.matrix(~ Trim.Team.B - 1, data = test1)
test1 = data.frame(test1, Team.B.matrix.test)

test = test1[, -c(1,3,4,6,5,7)]



## Random Forest Model


library(randomForest)

wc.rf = randomForest(as.factor(Team.A.Won) ~., data = train, 
                     ntree = 301, mtry = 6, nodesize = 10, important = TRUE)

print(wc.rf)

plot(wc.rf)

wc.rf$err.rate

rf.tune = tuneRF(x = train, y = as.factor(Team.A.Won), 
                 mtryStart = 8, ntreeTry = 200, stepFactor = 1.5, Improve = 0.001,
                 trace = TRUE, plot = TRUE, doBest = TRUE, important = TRUE, nodesize = 10)

wc.rf.tune = randomForest(as.factor(Team.A.Won) ~., data = train,
                          ntree = 200, mtry = 8, nodesize = 10, important = TRUE)

print(wc.rf.tune)

test1$Team.A.Win = predict(wc.rf.tune, test1, type = 'class')
test1$Team.A.Score = predict(wc.rf.tune, test1, type = 'prob')

test1 = test1[, -c(5:25)]
View(test1)


write.csv(test1, 'Random Forest Prediction after 25 June Matches.csv')


