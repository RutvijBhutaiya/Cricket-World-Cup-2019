
## ** CRICKET WORLD CUP 2019 ** ## 

## RF Modeling ##

library(randomForest)

wc <- read.csv('WC_Train.csv')
test1 = read.csv('Test_1992.csv')

# Clusters for WC as test and Previous 4 years Matches

C1992 = wc[which(wc$Year <= 1992),]
attach(C1992)

summary(C1992)









