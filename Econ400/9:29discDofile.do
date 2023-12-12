use https://users.ssc.wisc.edu/~mckelvey/ec400/earningsheight, clear

describe

regress earnings height weight, robust
** How should we interpret our estimate of the intercept? How about our estimate of the coefficient on weight? (Make sure your interpretation is attentive to the context, including the units.)

** Holding height constant, expected earnings is $12.08718 lower per additional pound, and holding weight constant, expected earnings is $766.2934 higher per additional inch in height.

** If you were to omit height from this regression model and simply regress earnings on weight, would you expect such a regression to suffer from omitted variable bias? If so, speculate about the direction in which the bias might go, being sure to explain your reasoning. Go ahead and run this underspecified model – a regression of earnings on weight, with height omitted.

** omitting height, regression on weight is biased positively

regress earnings weight, robust

use https://users.ssc.wisc.edu/~mckelvey/ec400/collegedistance, clear

regress ed dist, robust
