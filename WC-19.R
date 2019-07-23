
## ** CRICKET WORLD CUP 2019 ** ## 

# install.packages("CHAID", repos="http://R-Forge.R-project.org")

library(CHAID)

wc <- read.csv('WC_Train.csv')

test1 = read.csv('Test_2015.csv')

attach(wc)

train = wc[which(wc$Year >= 2007 & wc$Year <=2019),]        
        
train = train[, -c(3,4,7)]

## COnvert Year into Factor to support CHAID

train$Year = as.factor(train$Year)


ctrl  = chaid_control(minbucket = 30, minsplit = 100, alpha2 = 0.05, alpha4 = 0.05)

attach(train)

m1 = chaid(Won ~ Month + Year + Ground + Trim.Team.A + Trim.Team.B, data = train, control = ctrl)

print(m1)
plot(m1)

## Load TEst Dataset

test = read.csv('Test_Final.csv')

test$Won = predict(m1, test)
test$Prob.win = predict(m1, test, class = 'prob')

test = test[, -c(3,4,5)]

write.csv(test, 'CHAID Results.csv')

