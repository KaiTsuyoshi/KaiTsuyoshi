display "Kai Tsuyoshi"

use https://users.ssc.wisc.edu/~mckelvey/ec400/murderpanel, clear

describe

regress mrdrte exec unem, vce(cluster stateid)

regress cmrdrte cexec cunem, vce(cluster stateid) noconstant

xtreg mrdrte exec unem, fe i(stateid) vce(cluster stateid)

translate @Results Pset11.txt
