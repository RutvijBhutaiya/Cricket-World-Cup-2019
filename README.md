# Cricket-World-Cup-2019

WC matches prediction Approach:

1. Collect data from Jan 1987 to Feb 2019 for all ODIs took place between diffrent teams in the world. 

2. Create clusters World Cup (WC) wise : For e.g. WC 2003 : Traning data set - all matches took place between - after 1999 WC and before 2003 WC. And Testing data set WC matches for 2003. Similarly cluster for WC 2007 : Traning data set - - all matches took place between - after 2003 WC and before 2007 WC. And Testing data set WC matches for 2007. 

3. Run same model for all the clusters. 

Here, we are performing supervised model for 8 such clusters. Performance of the model on Testing data set will indicate the accuracy of the model not only 1 time but 7 time [8th cluster would be 2019 WC - which we are prediction] 

Why cluster approach : Because in early 2000s Australia was stong team, same was in early 1980s West Indies (WI) was strong team, However, based on ICC ranking in 2018-19 West Indies is not hign ranking team at all. So, we decided in early 1980s WI performance has very less signigicant impact on WC 2019 matches [However, WI team had significant impact on 1979 WC]. Mainly due to collective playesr performamce. 
Hence, WC clusters would give clear picture on team performance and - collective by team players. And, for this study it is important to see the team wise performamce, with competative team - from 2016 to early 2019 which has direct impact on WC 2019 matches. 
