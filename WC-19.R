
## ** CRICKET WORLD CUP 2019 ** ## 

wc <- read.csv('WC_Train.csv')

# Clusters for WC as test and Previous 4 years Matches

C1992 = wc[which(wc$Year <= 1992),]
