display "Kai Tsuyoshi"

use https://users.ssc.wisc.edu/~mckelvey/ec400/gss2016 

describe

regress educ maeduc paeduc, robust

regress educ maeduc, robust

regress educ maeduc paeduc zodiac, robust

translate @Results Pset4.txt
