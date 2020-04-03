
libname ssr 'E:\Users\ssr180000\Downloads';

data study;
set ssr.study_gpa;
run;

/*get to know the variable names used */
proc contents data=study;
run;

/* Part 1 - Graph the histogram for hours of study */

proc sgplot data= study;
 histogram AveTime / binstart = 0 binwidth = 5 ; 
 density AveTime / type = kernel; 
 density AveTime; 
 title 'Hours of study';
run;

/* Yes it can be said that hours of study follows a normal distribution. */

/* Part 2 - Conduct a statistical test to check whether the hours of study follows a normal distribution. */

proc univariate data=study normal; 
var AveTime;
run;

/* We know that Skewness indicates how asymmetrical the distribution is (whether it is more spread out on one side) while 
kurtosis indicates how flat or peaked the distribution is. The normal distribution has values of 0 for both skewness and kurtosis. 

When we observe the results produced by the univariate statistical procedure, we can conclude that since the value of skewness and
kurtosis is very close to zero, our estimation of the variable ' average hours of study ' is true to have an almost normal distribution.
*/



/* Part 3 - (c)	Conduct a hypothesis test to check whether there exists a significance correlation between units enrolled, 
hours of study and GPA for section 1 

H0: variables are not related
H1: variables are related
*/

proc corr data=study;
 where Section='01';
 var Units AveTime GPA;
run;

/* When we look closely at the correlation matrix generated, we can observe that the p-value for correlation between units and average
time and that of average time and gpa is smaller than alpha. Hence statistically significant. Whereas the correlation between units and 
gpa has p-value>alpha hence not statistically significant.

According to me more the units taken by the student, more the number of hours he studies for them in the week. Thus the variable units 
is a good candidate for causing the variable AveTime.

*/








