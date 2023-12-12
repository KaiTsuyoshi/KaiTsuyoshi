cls 
display "Kai Tsuyoshi - Problem set 1"

use https://users.ssc.wisc.edu/~mckelvey/ec410/pcsales.dta

describe

summarize totadexp, detail

correlate sales price

scatter sales price


translate @Results Pset1.txt, replace
