
##  ICC CRICKET WORLD CUP 2019 - EDA  ##

wc = read.csv('WC_Train.csv')

## Data From 2007 World Cup till 2018 Cricket Matches

wc = wc[which(wc$Year >= 2007 & wc$Year <=2018),]

test = read.csv('Test_Final.csv')

attach(wc)

## Data Study

dim(wc)               ## Rows and Cols

wc = wc[, -c(3,4)]    ## Remove coloum as they represents Trim.Team A and B. 

colSums(is.na(wc))    ## MIssing Values

str(wc)               ## Data Structure - Variables class

library(rpivotTable)

rpivotTable(wc)       ## PivotTable Analysis for Variables




