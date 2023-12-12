use https://users.ssc.wisc.edu/~mckelvey/ec400/gss2016


describe

generate parented = paeduc + maeduc

regress educ maeduc paeduc parented, robust

** maeduc was omitted because either the mothers education or fathers education or the parented variable can be omitted as educ can be explained by any combination of two of the variables


** use t statistic


**q4 test statistic
vce

display (.041958 + .1623587) / sqrt(.00155279 + .00058344 + 2*(-.00086139))



test paeduc parented

** probability of less than 0.05 indicates that the mother and father's education is indeed jointly significant




**exercise 2

use https://users.ssc.wisc.edu/~mckelvey/ec400/earningsheight, clear

tabulate mrd

tabulate mrd, nolabel

generate nvrmarr = mrd == 6

generate currmarr = mrd == 1 | mrd == 2 | mrd == 5

generate nolonger = mrd ==3 | mrd == 4

regress earnings currmarr nolonger, robust

generate female = sex == 0
