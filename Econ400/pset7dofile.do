display "Kai Tsuyoshi"

use https://users.ssc.wisc.edu/~mckelvey/ec400/smoke, clear

describe

regress cigs income restaurn, robust

test restaurn

generate inc_rest =  income * restaurn

regress cigs income restaurn inc_rest, robust

test inc_rest

use https://users.ssc.wisc.edu/~mckelvey/ec400/hprice, clear

generate sqrftxbdrms = sqrft * bdrms

regress price sqrft bdrms sqrftxbdrms, robust

display -35.95534 + (.023448 * 2200)

translate @Results Pset7.txt
