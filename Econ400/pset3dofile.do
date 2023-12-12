display "Kai Tsuyoshi"

use https://users.ssc.wisc.edu/~mckelvey/ec400/earningsheight, clear

describe

regress earnings height, robust

tabulate race, nolabel

generate hispanic = race == 3

regress earnings hispanic, robust

generate tall = height >= 77

regress earnings tall, robust


display (707.6716 - 800) / 50.39502 



translate @Results Pset3.txt
