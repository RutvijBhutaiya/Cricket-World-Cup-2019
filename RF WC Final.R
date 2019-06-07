
## Random Forest World Cup 1992 

wc = read.csv('WC_Train.csv')

## Pick Years 1992 till 1995 for traning data set

# train = wc[which(wc$Year >= 2003 & wc$Year <=2014),]
train = wc
#train = train[, -6]

attach(train)

## Creat dummy variable sfor Team A and Team B TRAIN

Team.A.matrix = model.matrix(~ Trim.Team.A - 1, data = train)
train = data.frame(train, Team.A.matrix)

Team.B.matrix = model.matrix(~ Trim.Team.B - 1, data = train)
train = data.frame(train, Team.B.matrix)

## Remove Year, Team A & Team B 

train = train[, -c(1,3,4,6,8,5,9)]


library(dplyr)

train = sample_frac(train, 1)



## TEST DATA SET

test1 = read.csv('Test_Final.csv')

Team.A.matrix.test = model.matrix(~ Trim.Team.A - 1, data = test1)
test1 = data.frame(test1, Team.A.matrix.test)

Team.B.matrix.test = model.matrix(~ Trim.Team.B - 1, data = test1)
test1 = data.frame(test1, Team.B.matrix.test)

test = test1[, -c(1,3,4,6,5,7)]



## Random Forest Model


library(randomForest)

wc.rf = randomForest(as.factor(Team.A.Won) ~., data = train, 
                     ntree = 301, mtry = 4, nodesize = 10, important = TRUE)

print(wc.rf)

plot(wc.rf)

wc.rf$err.rate

rf.tune = tuneRF(x = train, y = as.factor(Team.A.Won), 
                 mtryStart = 4, ntreeTry = 45, stepFactor = 1.5, Improve = 0.001,
                 trace = TRUE, plot = TRUE, doBest = TRUE, important = TRUE, nodesize = 10)

wc.rf.tune = randomForest(as.factor(Team.A.Won) ~., data = train,
                          ntree = 45, mtry = 3, nodesize = 10, important = TRUE)

print(wc.rf.tune)


test1$pred.class = predict(wc.rf, test1, type = 'class')
test1$pred.score = predict(wc.rf, test, type = 'prob')

test1 = test1[, -c(5:25)]
