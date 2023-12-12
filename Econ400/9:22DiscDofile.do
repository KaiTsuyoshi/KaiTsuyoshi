use https://users.ssc.wisc.edu/~mckelvey/ec400/sectionwk3

describe

tabulate gender

generate female = gender=="Female" 

tabulate female

regress earnings female, robust

** How do you interpret the intercept and the coefficient on the female dummy in this regression? 

** The estimated earnings of males is 48459.75, and -2838.752 is the difference in earnings between males and females

** Based on the regression output, is the gender earnings gap statistically significant? Is it economically significant?

** The earning gap is statistically significant, as the absolute value of the t statistic of the female coefficient is greater than 1.96 (t value of 0.05 significance level). 

**Using this regression output, test whether expected earnings for men is equal to $49,000. Use a 5% size of test.

** (48459.75 - 49000) / 303.3109 = -1.7811757 ; which falls within the range of 1.96, meaning we cannot reject the null, and that estimated male earnings is equal to 49000 at a 5% size of test.

** Using this regression output, test whether the gender earnings gap is negative. Use a 5% significance level.
 
** -7.01 is significantly negative 

** How would you create a male dummy variable? If you ran a re-gression of earnings on male, how would the interpretation of the coefficients differ from the interpretation of the coefficients in the previous model? If you're unsure, give it a try. 

generate male = gender=="Male"

regress earnings male, robust

** only the male earning coefficient is different in that it is positive, as there is now a positive differnce in earning. 

use https://users.ssc.wisc.edu/~mckelvey/ec400/earningsheight, clear

describe

tabulate sex

** generate female = sex=="0:female" does not work, as it is a label, hence; 

tabulate sex, nolabel

generate female = sex==0

generate colgrad = educ >= 16

regress earnings colgrad, robust level(98)


