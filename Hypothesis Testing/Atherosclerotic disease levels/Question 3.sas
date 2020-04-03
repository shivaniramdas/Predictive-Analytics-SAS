
libname ssr 'E:\Users\ssr180000\Downloads';
data vitamin;
set ssr.vite;
run;
proc contents data=vitamin;
run;

/* Part 1 - Assuming there were no placebo (i.e., control) group, How would you test whether there is a difference in plaque 
level before treatment and after the second visit? */

data no_placebo;
  set ssr.vite(where=(Treatment=1));
run;
proc transpose data=no_placebo out=transformed(drop=_: col2 rename=(col1=before col3=after_second));                                                                                       
   by ID Strata;                                                                                                                               
   var Plaque; 
run;

/* 	Type of test - paired sample t-test since the observations are drawn from a single sample and we will be considering the before 
and after effects for each person. 
	H0: Plaque measurement before treatment <= Plaque measurement after second visit
	H1: Plaque measurement before treatment > Plaque measurement after second visit */

proc ttest data=transformed alpha=0.05;
 paired before*after_second;
 by Strata;
run;

/* From the ttest, we observe that the average difference is 0.0484 and 0.0112 when strata was 1 and 2 respectively which indicates 
the presence of a positive difference meaning that the plaque was greater before the treatment was started. 
Also p-value<0.05 we can conclude that there is a difference in plaque level. */

/* Part 2 - now that there exists a control group, how will you change your hypothesis test in part (a) 
	Type of test - independent 2 sample t-test since we now have 2 different samples, one with a placebo and the rest were given
	vitamin e treatment. Subjects in each of these groups were then recorded as per the visits.
	H0: Plaque measurement for placebo treatment <= Plaque measurement for vitamin e
	H1: Plaque measurement for placebo treatment > Plaque measurement for vitamin e             */

data control_treatment;
set ssr.vite;
run;
proc ttest data=control_treatment alpha=0.05;
 class Treatment;
 var Plaque;
 by Strata;
run;
/* its important to understand the variance of the population, we can observe that in the table for equal variances, p>alpha hence 
we fail to reject the null ie they have equal variances. in the table just above qwe check ther values for pooled method and notice
that p<alpha. thus we reject the null and can conclude Plaque measurement for placebo treatment > Plaque measurement for vitamin e

/*Part 3 - According to me, performing an independent 2-sample test like that in part 2 is more reliable.

As for this example we can see, the sunjects were initially grouped into 2 depending on whether they had a plaque measurement 
of 0.60+ or 0.6- at baseline. These groups were further divided into 2 based on the treatment they recieved. for example, if the subject had
0.60+ at baseline and was directly given a vitamin e treatment, we wouldnt know if it was exactly the reason for cure or were there any 
changes in his diet during this period or any other factors that werent recorded in the database. to avoid making a wrong claim we need
to put the people in this category under both the treatments. it also gives a better understanding of whether they are related or not. 

Thus randomizing the subjects in control and treatment groups plays a vital role in this example.*/

/* Part 4 - 
type of test - 2 sample ttest
H0: the average number of cigarettes smoked per day per individual is not equal for two groups
H1: the average number of cigarettes smoked per day per individual is equal for two groups
*/

proc sort data=control_treatment;
by Treatment;
run;

proc means data=control_treatment nway noprint;
  var Smoke;
  class ID;
  by Treatment;
  output 
    out=average_smoke(drop=_:)
    mean=;
run;

proc ttest data=average_smoke alpha=0.05;
 class Treatment;
 var Smoke;
run;

/* We can observe that in the table for equal variances, p<alpha hence we reject the null ie consider unequal variances. 
In the table just above we check ther values for Satterthwaite method and notice that p<alpha. Thus we reject the null and 
can conclude the average number of cigarettes smoked per day per individual is equal for two groups and thus the subjects are 
randomized perfectly wrt smoke */

proc means data=control_treatment nway noprint;
  var Alcohol;
  class ID;
  by Treatment;
  output 
    out=average_alcohol(drop=_:)
    mean=;
run;

proc ttest data=average_alcohol alpha=0.05;
 class Treatment;
 var Alcohol;
run;

/* We can observe that in the table for equal variances, p>alpha hence we fail to reject the null ie consider equal variances. 
In the table just above we check ther values for pooled method and notice that p>alpha. Thus we fail to reject the null and 
can conclude the average number of drinks per day per individual is not equal for two groups and thus the subjects are not
randomized perfectly wrt alcohol */








 

