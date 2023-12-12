display "Kai Tsuyoshi"

use https://users.ssc.wisc.edu/~mckelvey/ec400/collegedistance, clear

describe

regress ed dist

generate dist100 = dist / 10

regress ed dist100

predict edhat

scatter ed dist100 || line edhat dist100



display  -.7337271 * 2000 + 13.95586 


translate @Results Pset2.txt
