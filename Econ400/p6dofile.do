display "Kai Tsuyoshi" 

use https://users.ssc.wisc.edu/~mckelvey/ec400/hprice,clear

describe

generate natlogprice = ln(price)

generate natlogsqrft = ln(sqrft)

regress natlogprice natlogsqrft, robust

regress price natlogsqrft, robust

regress natlogprice sqrft, robust

regress price sqrft, robust

generate sqrdsqrft = (sqrft)^2

regress price sqrft sqrdsqrft, robust 

display -(-(0.0171086) / (2 * 0.0000326))

test sqrft sqrdsqrft

regress sqrft sqrdsqrft, robust

translate @Results Pset6.txt
