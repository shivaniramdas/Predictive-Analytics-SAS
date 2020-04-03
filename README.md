# Predictive-Analytics-with-SAS

> This project was performed during the learning of SAS. For each section, multiple situations were considered and problem statements were identified and programmed in SAS. 

## Descriptive Analysis and Hypothesis Testing

The United States Geological Survey provides data on earthquakes of historical interest. The SAS data set called EARTHQUAKES contains data about earthquakes with a magnitude greater than 2.5 in the United States and its territories. The variables are year, month, day, state, and magnitude. 

* California and Alaska being the two states with the highest number of earthquakes in the country, how does the magnitude of earthquakes trend over time for each state?
* Are the average magnitude of earthquakes in California significantly higher than that in Alaska?

At a local university, the study guidelines for the College of Science and Math are to study two to three hours per unit per week. The instructor of the class, Orientation to the Statistics Major, takes these guidelines very seriously. He asks students to record their study time each week, and at the end of the term he compares their average study time per week to their term GPA. The SAS data set called STUDY_GPA contains student identification information, orientation course-section number, number of units enrolled, average time studied, and term GPA. 

* Statistical test to check whether the hours of study follows a normal distribution.
* Causality and correlation: Test to check whether there exists a significant correlation between units enrolled, hours of study and GPA for section 1 students.

A study was conducted to see whether taking vitamin E daily would reduce the levels of atherosclerotic disease in a random sample of 500 individuals. Clinical measurements, including thickness of plaque of the carotid artery (taken via ultrasound), were recorded at baseline and at two subsequent visits in a SAS data set called VITE. Patients were divided into two strata according to their baseline plaque measurement. 

* Assuming there were no placebo(i.e. control) group, is a difference in plaque level before treatment and after second visit? 
* Is taking vitamin E significantly effective in reducing the plaque level.
* Check whether subjects are randomized perfectly using the following: average number of cigarettes smoked per day per individual is the same for both groups and the average amount of alcohol drunk per day per individual is the same for both groups. 

## Regression Analysis

Developed a regression model that predicts the global sales based on the critic and user review ratings for videogames launched between 2001 and 2012. This dataset has been obtained from www.vgchartz.com

Data fields

Variable | Description
-------------|-----------
ID | The id of a video game
Name | The games name
Platform | Platform of the games release (i.e. PC,PS4, etc.)
Year_of_Release | Year of the game's release
Genre | Genre of the game
Publisher | Publisher of the game
Developer | Party responsible for creating the game
Rating | The ESRB ratings
Critic_score | Aggregate score compiled by Metacritic staff
Critic_count | The number of critics used in coming up with the Critic_score
User_score | Score by Metacritic's subscribers
User_count | Number of users who gave the user_score
Global_Sales | Total worldwide sales

Platforms

Abbreviation | Description
-------------|-----------
DS | Nintendo DS
GBA | Nintendo Game Boy Advance
GC | Nintendo Game Cube
PC | Personal Computer
PS2 | Sony PlayStation 2
PS3 | Sony PlayStation 2
PSP | Sony PlayStation Portable
Wii | Nintendo Wii
X360 | Microsoft XBOX 360
XB | Microsoft XBOX

* Explored ways in which the model fit could be improved through suitable changes to the model specification and variables
* For the model constructed, verified whether the various regression assumptions are satisfied. If an assumption is violated, discussed how it can be handled in the report, and implemented the same in SAS.


## Model evaluation and Classification

For this section, the SAS dataset HeinzHunts has data on grocery store purchases of Hunts and Heinz ketchup. Each observation corresponds to one purchase occasion (of one of these brands) and consists of the following variables:

Variable | Description
---------|------------
Heinz | =1 if Heinz was purchased, =0 if Hunts was purchased
PriceHeinz | Price of Heinz 
PriceHunts | Price of Hunts
DisplHeinz | = 1 if Heinz had a store display, =0 if Heinz did not have a store display
DisplHunts | = 1 if Hunts had a store display, =0 if Hunts did not have a store display
FeatureHeinz | = 1 if Heinz had a store feature, =0 if Heinz did not have a store feature
FeatureHunts | = 1 if Hunts had a store feature, =0 if Hunts did not have a store feature

* Estimated a logit probability model for the probability that Heinz is purchased taking into consideration interaction terms between display and feature for a particular brand (e.g., DisplHeinz * FeatureHeinz) along with other explanatory variables. 

* Based on the estimated model, explored the changes in predicted probability that Heinz is purchased if LogPriceRatio changes from 0.5 to 0.6 and Heinz does not use a feature or display, while Hunts uses a feature and a display.

The estimated model is to be used for targeting customers for Hunts coupons to build loyalty for the brand. Coupons are to be sent to customers who are likely to buy Hunts, and not to customers who are likely to buy Heinz. Therefore, the coupons should be sent to customers whose predicted probability of buying Heinz is below a certain threshold level that needs to be determined based on the costs of misclassifications (incorrectly sending / not sending a coupon). The cost of incorrectly sending a coupon to a customer who would have bought Heinz is $1 per customer, and the cost of incorrectly failing to send a coupon to a customer who would have bought Hunts is $0.25 per customer. 

* Estimated the optimal threshold probability level that should be used with the estimated model to decide which consumers should receive coupons using ROC metrics

