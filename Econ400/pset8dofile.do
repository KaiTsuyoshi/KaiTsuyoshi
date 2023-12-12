display "Kai Tsuyoshi"

use https://users.ssc.wisc.edu/~mckelvey/ec400/murder93, clear

regress mrdrte exec, robust

predict mrdrtehat

scatter mrdrte exec || line mrdrtehat exec

regress mrdrte exec if mrdrte < 60, robust

regress mrdrte exec if exec < 30, robust

qreg mrdrte exec, vce(robust)

regress mrdrte exec if state != "DC", robust

use https://users.ssc.wisc.edu/~mckelvey/ec400/smoking, clear

regress smoker age, robust

logit smoker age, robust

probit smoker age, robust

translate @Results Pset8.txt

