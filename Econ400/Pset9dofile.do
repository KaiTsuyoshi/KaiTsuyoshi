display "Kai Tsuyoshi"

use https://users.ssc.wisc.edu/~mckelvey/ec400/nsw, clear

describe

regress age treat, robust
regress education treat, robust
regress black treat, robust
regress hispanic treat, robust
regress married treat, robust
regress nodegree treat, robust

regress re78 treat, robust

translate @Results Pset9.txt
