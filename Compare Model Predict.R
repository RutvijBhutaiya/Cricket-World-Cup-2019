
## RANDOM FOREST VS. LOGISTIC REGRESSION PREDICTION

RF = read.csv('Random Forest Prediction.csv')
LR = read.csv('Logistic Regression Prediction.csv')


RF = RF[, c(4,5,6,8)]
LR = LR[, c(4,5,6,7)]

ComparePredict = data.frame(RF,LR)

colnames(ComparePredict)[colnames(ComparePredict) == 'Team.A.Win'] = 'RF Team.A.Win'
colnames(ComparePredict)[colnames(ComparePredict) == 'Team.A.Win.1'] = 'LR Team.A.Win'

colnames(ComparePredict)[colnames(ComparePredict) == 'Team.A.Score.1'] = 'Prob % RF Team.A.Win'
colnames(ComparePredict)[colnames(ComparePredict) == 'predict.logit'] = 'Prob % LR Team.A.Win'

ComparePredict = ComparePredict[, -c(5,6)]

write.csv(ComparePredict, 'Compare Predict - RF vs. LR.csv')
