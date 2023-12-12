**9/8/2023 Discussion**

**use cls to clear all previous output when using dofile for commands **

cls


** use a default dataset **
use http://www.stata-press.com/data/r9/auto, clear

** use decribe to get an overview of the data such as variable names and labels**
describe

** use browse to view data in a spreadsheet format**
browse  

** compress variable information into usable statistics; mean, std. dev, min, max** 
summarize trunk

** for more detailed information on the same variable, add detail**
summarize trunk, detail

** use tabulate to give counts and percentages of frequencies of variables**
tabulate trunk

** use ci for confidence interval, use level to specify confidence interval area**
ci means price, level(98)

** use correlate for correlation coefficient between two variables**
correlate price trunk

** use scatter to plot relationship between two variables**
scatter price trunk


** to make a text only stata log file: **
translate @Results file_name.txt

**to replace a file, use **
translate @Results file_name.txt, replace
