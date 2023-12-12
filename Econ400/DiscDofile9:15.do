use http://www.stata-press.com/data/r14/auto 


describe

** run regression of price on trunk space (price is dependent variable while trunk is explanatory)
regress price trunk

** find predicted value of an observation and prdict command can only be used after running regression
predict pricehat

** use predict to store resideuals for each observation
predict uhat, residuals

** look at how the prior predict commands have done
list price trunk pricehat uhat in 1/10

** create a scatter plot with regression line, done by creating a scatter plot and using the double pipe to add the regression line
scatter price trunk || line pricehat trunk

** create variables with the generate command
generate trunkcbm = trunk/34


** use the drop command to remove the variables

drop trunkcbm

generate trunkcbm = trunk/35.3147

regress price trunkcbm



** Exercise 1 

** generate new variable that contains the price of each car in thousands of dollars

generate priceink = price/1000

** run regression of price on trunk space in cubic feet

regress priceink trunk



** Exercise 2 

use https://www.ssc.wisc.edu/~mckelvey/ec400/cps12, clear

describe

regress ahe age

predict ahehat

scatter ahe age || line ahehat age

** to find predicted earnings for a 28 yr old: 
display 4.62605 + .5118171 *28

** to find the difference between hourly earnings of a 32 yr old vs a 28 yr old
display 4 * .5118171

summarize ahe





