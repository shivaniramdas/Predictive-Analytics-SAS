
/* Part 1 - Creating a new dataset where the the state = alaska or california */

libname ssr 'E:\Users\ssr180000\Downloads';

data cali_alaska;
set ssr.earthquakes;
if (state = 'Alaska' or state = 'California');
run;

proc print data=cali_alaska;
run;


/* Part 2 - tablulating the summary statistics for magnitude of the earthquakes across different states within each year from
2002 to 2011*/

proc means data=cali_alaska mean stddev min p25 median p75 max maxdec= 2;
 where year>=2002 and year<=2011;
 class year state;
 var magnitude;
 title 'Summary Statistics of Magnitude';
run;

/* Part 3 - Modify SAS code in (a) such that the results for each year are shown in a separate table */

proc sort data=cali_alaska;
by year;
run;

proc means data=cali_alaska n mean stddev min p25 median p75 max maxdec= 2;
 where year>=2002 and year<=2011;
 by year; 
 class state;
 var magnitude;
 title 'Summary Statistics';
run;

/* Part 4 - show the same results in part(a) but with the difference that years are shown in the first column and the states 
are shown in the top row. */

proc tabulate data=cali_alaska;
where year>=2002 and year<=2011;
class year state;
var magnitude;
table year*(magnitude),state*(N Mean StdDev Min p25 Median p75 Max);
title 'Summary Statistics of Magnitude';
run;

/* Part 5 - In one graph, plot two time series plots, side by side, which shows the trend of average magnitude of earthquakes 
over time for the two states.  */

proc sort data=cali_alaska;
by year state;
run;

proc means data=cali_alaska mean maxdec= 2 noprint;
 by year state;
 var magnitude;
 output out=means 
  mean= AvgMagnitude;
run;

proc sgpanel data= means;
 panelby state;
 series x=year y=AvgMagnitude;
 title 'Trend in magnitude over time';
run;



/* Part 6 - Test the hypothesis
	H0: average magnitude of earthquakes in California <= average magnitude of earthquakes in Alaska
	H1: average magnitude of earthquakes in California > average magnitude of earthquakes in Alaska
	Test - 2 independent sample t-test
*/

proc ttest data=means;
 class state;
 var AvgMagnitude;
 title 'hypothesis testing';
run;

/* Report the results: 
when we look carefully at the hypothesis test of equality of variances for the population, it is clear that p-value>alpha ie 0.28>0.05
Hence we fail to reject the null implying presence of equal variances. 
Now we check the pooled method for equal variances to observe that the p-value<alpha hence we reject the null. 

Therefore we have found enough evidence to claim that average magnitude of earthquakes in California > average magnitude of 
earthquakes in Alaska */





























