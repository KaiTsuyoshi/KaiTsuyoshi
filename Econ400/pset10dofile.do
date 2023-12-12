display "Kai Tsuyoshi"

use https://users.ssc.wisc.edu/~mckelvey/ec400/microfinance, clear

generate eligible = hhland < 50

regress exptot eligible if yr98 == 1, robust

generate treatment_interaction = yr98 * eligible

regress exptot eligible yr98 treatment_interaction, robust

translate @Results Pset10.txt
