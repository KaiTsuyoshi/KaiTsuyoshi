use https://www.stata-press.com/data/r14/auto, clear

describe

generate mpgforeign = mpg * foreign

regress price mpg foreign mpgforeign, robust

test mpg + mpgforeign = 0

