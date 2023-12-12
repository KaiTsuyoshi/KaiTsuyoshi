display "Kai Tsuyoshi"

use https://users.ssc.wisc.edu/~mckelvey/ec400/wage2

describe

regress lwage educ sibs, robust

regress educ brthord, robust

ivregress 2sls lwage (educ = brthord) sibs, first robust

translate @Results Pset12.txt
