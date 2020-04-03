libname ssr 'E:\Users\ssr180000\Downloads';

/* Part 1 */

data hhdata;
set ssr.heinzhunts;
LogPriceRatio=log(priceheinz/pricehunts);
run;

/* Part 2 */

proc surveyselect data=hhdata out=hhdata_sampled outall samprate=0.8 seed=10;
run;

data hh_training hh_test;
 set hhdata_sampled;
 if selected then output hh_training; 
 else output hh_test;
run;

/* Part 3 */

proc logistic data=hhdata_sampled;
 logit: model Heinz (event='1') = FeatHeinz FeatHunts  DisplHeinz DisplHunts LogPriceRatio DisplHeinz*FeatHeinz DisplHunts*FeatHunts;
 weight selected; /*only training sample is used for estimation, since selected = 0 for test sample */
run;
