
## ** CRICKET WORLD CUP 2019 ** ## 

# install.packages("CHAID", repos="http://R-Forge.R-project.org")

library(CHAID)

wc <- read.csv('WC_Train.csv')
test1 = read.csv('Test_2015.csv')

attach(wc)

bb = wc[which(wc$Year >=2000 & wc$Year <=2015),]
        
        
# Clusters for WC as test and Previous 4 years Matches

#C1992 = wc[which(wc$Year <= 1992),]
#attach(C1992)

#summary(C1992)

#C1992 = C1992[, -6]
bb = bb[, -6]
test1 = test1[, c(-6,-2)]

#C1992$Team.A.Won = as.factor(C1992$Team.A.Won)
bb$Team.A.Won = as.factor(bb$Team.A.Won)

ctrl  = chaid_control(minbucket = 10, minsplit = 100, alpha2 = 0.05, alpha4 = 0.05)

m1 = chaid(Team.A.Won ~ Month + Team.A + Team.B + Ground, data = bb, control = ctrl)

print(m1)
plot(m1)

test1$Team.AA.Won = predict(m1, test1)
test1$Prob.win = predict(m1, test1, class = 'prob')

ch = table(Team.A, Won)
chisq.test(ch)

