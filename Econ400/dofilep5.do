display "Kai Tsuyoshi"


use https://users.ssc.wisc.edu/~mckelvey/ec400/pcsales,clear

describe

regress sales price tvadexp radioadexp, robust

regress sales price totadexp radioadexp, robust

regress sales price totadexp, robust



use https://users.ssc.wisc.edu/~mckelvey/ec400/earningsheight, clear

describe


tabulate region, nolabel

generate west = region==4

generate south = region==3

generate midwest = region==2

generate northeast = region==1

regress earnings south northeast midwest, robust

test midwest = south


test south northeast midwest



translate @Results Pset5.txt
