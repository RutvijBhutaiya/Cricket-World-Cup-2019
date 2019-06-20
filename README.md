# Cricket-World-Cup-2019



# Approach (Cluster wise): (What went Wrong in this Approach - Explained)

POINT 1. Collect data from Jan 1987 to Feb 2019 for all ODIs took place between diffrent teams in the world. 

POINT 2. Create clusters World Cup (WC) wise : For e.g. WC 2003 : Traning data set - all matches took place between - after 1999 WC and before 2003 WC. And Testing data set WC matches for 2003. Similarly cluster for WC 2007 : Traning data set - - all matches took place between - after 2003 WC and before 2007 WC. And Testing data set WC matches for 2007. 

POINT 3. Run same model for all the clusters. 

POINT 4. Here, we are performing supervised model for 8 such clusters. Performance of the model on Testing data set will indicate the accuracy of the model not only 1 time but 7 time [8th cluster would be 2019 WC - which we are prediction] 

POINT 5. Why cluster approach : Because in early 2000s Australia was stong team, same was in early 1980s West Indies (WI) was strong team, However, based on ICC ranking in 2018-19 West Indies is not hign ranking team at all. So, we decided in early 1980s WI performance has very less signigicant impact on WC 2019 matches [However, WI team had significant impact on 1979 WC]. Mainly due to collective playesr performamce. 

Hence, WC clusters would give clear picture on team performance and - collective by team players. And, for this study it is important to see the team wise performamce, with competative team - from 2016 to early 2019 which has direct impact on WC 2019 matches.  

~~~~~~~~

POINT 2 & 3 ! <-- Method didn't worked. Not able to get good predicted results - Based on small ddataset - clusters wise.
POINT 5 ! <-- Cluster approach didn't worked due to small data set in each cluster, difficult to tune RF for each cluster. However, for 8th cluster again RF tuning requires.

~~~~~~~~

# WC Model Preparation : 

- Build Model based on 2007 to 2018 dataset [We decided to work on datset from 2007 till Dec 2018 ODI cricket matches Only. Because, we also trained models on data 1987 till Dec 2018, However, accuracy on new dataset models from 2007 to 2018 dataset is high - and also,  it makes sence to consider team performance in recent years than late past years like 1990s]. 
- Coverted variables into dummy variables and used Random Forest technique. 
- Also Build Model with Logistic Regression Technique.

# Approach (Random Forest) 

In new RF approach for data set [From 2007 to 2018], we decided to include Year variable - based on which, model identifies team perfromance in latest years [Like best team based on winning for year 2016 -17 -18  etc.]

# Evaluation : [Pending]


# Approach (Logistic Regression) 

Similarly, in Logistic Regression approach we trained same dataset. 

As conclusion, Logistic Regregression approach is right method to predict ICC World Cup Cricket 2019 game for the dataset.  Because, in the model we have also added results in 'predict.logit' variable. This variable predicts the probability of Team A winning.  HOwever, in case of mid probability figures - like between 0.45 to 0.65, it literally becomes tought to predict team winning. 

# Evaluation : [Pending]


# Compare Predicted Results 

In this study we have compared the predicted results from Random Forest Modela vs. Logistic Regression Model vs. Actual match result. 
