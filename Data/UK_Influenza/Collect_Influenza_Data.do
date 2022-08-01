
** 1900-1910
import excel "D:\Documents\GitHub\Schroeder-et-al.-2021--How-long-do-pandemics-last-\Data\UK_Influenza\1901-1910-icd1\icd1.xls", sheet("ICD1") firstrow clear
keep if icd_1  == "0120"
collapse (sum) ndths , by(yr sex age) 
save "D:\Documents\GitHub\Schroeder-et-al.-2021--How-long-do-pandemics-last-\Data\UK_Influenza\temp_1.dta"

** 1911-1920

import excel "D:\Documents\GitHub\Schroeder-et-al.-2021--How-long-do-pandemics-last-\Data\UK_Influenza\1911-1920-icd2\icd2.xls", sheet("icd2_2") firstrow clear
save "D:\Documents\GitHub\Schroeder-et-al.-2021--How-long-do-pandemics-last-\Data\UK_Influenza\temp.dta" , replace
import excel "D:\Documents\GitHub\Schroeder-et-al.-2021--How-long-do-pandemics-last-\Data\UK_Influenza\1911-1920-icd2\icd2.xls", sheet("icd2_1") firstrow clear
append using "D:\Documents\GitHub\Schroeder-et-al.-2021--How-long-do-pandemics-last-\Data\UK_Influenza\temp.dta"
keep if ICD_ == "10"
collapse (sum) ndths , by(yr sex age) 
save "D:\Documents\GitHub\Schroeder-et-al.-2021--How-long-do-pandemics-last-\Data\UK_Influenza\temp_2.dta"

** 1921-1930

import excel "D:\Documents\GitHub\Schroeder-et-al.-2021--How-long-do-pandemics-last-\Data\UK_Influenza\1921-1930-icd3\icd3.xls", sheet("icd3_2") firstrow clear
save "D:\Documents\GitHub\Schroeder-et-al.-2021--How-long-do-pandemics-last-\Data\UK_Influenza\temp.dta", replace
import excel "D:\Documents\GitHub\Schroeder-et-al.-2021--How-long-do-pandemics-last-\Data\UK_Influenza\1921-1930-icd3\icd3.xls", sheet("icd3_1") firstrow clear
append using "D:\Documents\GitHub\Schroeder-et-al.-2021--How-long-do-pandemics-last-\Data\UK_Influenza\temp.dta"
gen inf = 1 if strmatch(ICD_3, "11a*") | strmatch(ICD_3, "11b*")
keep if inf == 1
collapse (sum) ndths , by(yr sex age) 
save "D:\Documents\GitHub\Schroeder-et-al.-2021--How-long-do-pandemics-last-\Data\UK_Influenza\temp_3.dta"

** 1931-1939

import excel "D:\Documents\GitHub\Schroeder-et-al.-2021--How-long-do-pandemics-last-\Data\UK_Influenza\1931-1939-icd4\icd4.xls", sheet("icd4_2") firstrow clear
save "D:\Documents\GitHub\Schroeder-et-al.-2021--How-long-do-pandemics-last-\Data\UK_Influenza\temp.dta", replace
import excel "D:\Documents\GitHub\Schroeder-et-al.-2021--How-long-do-pandemics-last-\Data\UK_Influenza\1931-1939-icd4\icd4.xls", sheet("icd4_1") firstrow clear
append using "D:\Documents\GitHub\Schroeder-et-al.-2021--How-long-do-pandemics-last-\Data\UK_Influenza\temp.dta"
gen inf = 1 if strmatch(ICD_4, "11a*") | strmatch(ICD_4, "11b*")
keep if inf == 1
collapse (sum) ndths , by(yr sex age) 
save "D:\Documents\GitHub\Schroeder-et-al.-2021--How-long-do-pandemics-last-\Data\UK_Influenza\temp_4.dta"

** 1940-1949

import excel "D:\Documents\GitHub\Schroeder-et-al.-2021--How-long-do-pandemics-last-\Data\UK_Influenza\1940-1949-icd5\icd5.xls", sheet("icd5_2") firstrow clear
save "D:\Documents\GitHub\Schroeder-et-al.-2021--How-long-do-pandemics-last-\Data\UK_Influenza\temp.dta", replace
import excel "D:\Documents\GitHub\Schroeder-et-al.-2021--How-long-do-pandemics-last-\Data\UK_Influenza\1940-1949-icd5\icd5.xls", sheet("icd5_1") firstrow clear
append using "D:\Documents\GitHub\Schroeder-et-al.-2021--How-long-do-pandemics-last-\Data\UK_Influenza\temp.dta"
gen inf = 1 if strmatch(ICD_5, "33a*") | strmatch(ICD_5, "33b*")
keep if inf == 1
collapse (sum) ndths , by(yr sex age) 
save "D:\Documents\GitHub\Schroeder-et-al.-2021--How-long-do-pandemics-last-\Data\UK_Influenza\temp_5.dta"

** 1950-1957

import excel "D:\Documents\GitHub\Schroeder-et-al.-2021--How-long-do-pandemics-last-\Data\UK_Influenza\1950-1957-icd6\icd6.xls", sheet("icd6_2") firstrow clear
save "D:\Documents\GitHub\Schroeder-et-al.-2021--How-long-do-pandemics-last-\Data\UK_Influenza\temp.dta", replace
import excel "D:\Documents\GitHub\Schroeder-et-al.-2021--How-long-do-pandemics-last-\Data\UK_Influenza\1950-1957-icd6\icd6.xls", sheet("icd6_1") firstrow clear
append using "D:\Documents\GitHub\Schroeder-et-al.-2021--How-long-do-pandemics-last-\Data\UK_Influenza\temp.dta"
keep if ICD_6 == "4800" | ICD_6 == "4810"|ICD_6 == "4811"| ICD_6 == "4820"| ICD_6 == "4830"
collapse (sum) ndths , by(yr sex age) 
save "D:\Documents\GitHub\Schroeder-et-al.-2021--How-long-do-pandemics-last-\Data\UK_Influenza\temp_6.dta"

** 1958-1967

import excel "D:\Documents\GitHub\Schroeder-et-al.-2021--How-long-do-pandemics-last-\Data\UK_Influenza\1958-1967-icd7\icd7.xlsx", sheet("icd7_3") firstrow clear
save "D:\Documents\GitHub\Schroeder-et-al.-2021--How-long-do-pandemics-last-\Data\UK_Influenza\temp.dta", replace
import excel "D:\Documents\GitHub\Schroeder-et-al.-2021--How-long-do-pandemics-last-\Data\UK_Influenza\1958-1967-icd7\icd7.xlsx", sheet("icd7_2") firstrow clear
append using "D:\Documents\GitHub\Schroeder-et-al.-2021--How-long-do-pandemics-last-\Data\UK_Influenza\temp.dta"
save "D:\Documents\GitHub\Schroeder-et-al.-2021--How-long-do-pandemics-last-\Data\UK_Influenza\temp.dta", replace
import excel "D:\Documents\GitHub\Schroeder-et-al.-2021--How-long-do-pandemics-last-\Data\UK_Influenza\1958-1967-icd7\icd7.xlsx", sheet("icd7_1") firstrow clear
append using "D:\Documents\GitHub\Schroeder-et-al.-2021--How-long-do-pandemics-last-\Data\UK_Influenza\temp.dta"
keep if ICD_7 == "4800" | ICD_7 == "4810"|ICD_7 == "4820"| ICD_7 == "4830"
collapse (sum) ndths , by(yr sex age) 
save "D:\Documents\GitHub\Schroeder-et-al.-2021--How-long-do-pandemics-last-\Data\UK_Influenza\temp_7.dta"

** 1968-1978

import excel "D:\Documents\GitHub\Schroeder-et-al.-2021--How-long-do-pandemics-last-\Data\UK_Influenza\1968-1978-icd8\icd8.xls", sheet("icd8_3") firstrow clear
save "D:\Documents\GitHub\Schroeder-et-al.-2021--How-long-do-pandemics-last-\Data\UK_Influenza\temp.dta", replace
import excel "D:\Documents\GitHub\Schroeder-et-al.-2021--How-long-do-pandemics-last-\Data\UK_Influenza\1968-1978-icd8\icd8.xls", sheet("icd8_2") firstrow clear
append using "D:\Documents\GitHub\Schroeder-et-al.-2021--How-long-do-pandemics-last-\Data\UK_Influenza\temp.dta"
save "D:\Documents\GitHub\Schroeder-et-al.-2021--How-long-do-pandemics-last-\Data\UK_Influenza\temp.dta", replace
import excel "D:\Documents\GitHub\Schroeder-et-al.-2021--How-long-do-pandemics-last-\Data\UK_Influenza\1968-1978-icd8\icd8.xls", sheet("icd8_1") firstrow clear
append using "D:\Documents\GitHub\Schroeder-et-al.-2021--How-long-do-pandemics-last-\Data\UK_Influenza\temp.dta"
keep if ICD_8 == "4700"| ICD_8 == "4710" | ICD_8 == "4720"|ICD_8 == "4730"| ICD_8 == "4740"| ICD_8 == "7612"
collapse (sum) ndths , by(yr sex age) 
save "D:\Documents\GitHub\Schroeder-et-al.-2021--How-long-do-pandemics-last-\Data\UK_Influenza\temp_8.dta"

** 1979-1984
import excel "D:\Documents\GitHub\Schroeder-et-al.-2021--How-long-do-pandemics-last-\Data\UK_Influenza\1979-1984-icd9a\icd9_a.xlsx", sheet("icd9_2") firstrow clear
save "D:\Documents\GitHub\Schroeder-et-al.-2021--How-long-do-pandemics-last-\Data\UK_Influenza\temp.dta", replace
import excel "D:\Documents\GitHub\Schroeder-et-al.-2021--How-long-do-pandemics-last-\Data\UK_Influenza\1979-1984-icd9a\icd9_a.xlsx", sheet("icd9_1") firstrow clear
append using "D:\Documents\GitHub\Schroeder-et-al.-2021--How-long-do-pandemics-last-\Data\UK_Influenza\temp.dta"
keep if ICD_9 == "4870"| ICD_9 == "4871" | ICD_9 == "4878"
collapse (sum) ndths , by(yr sex age) 
save "D:\Documents\GitHub\Schroeder-et-al.-2021--How-long-do-pandemics-last-\Data\UK_Influenza\temp_9.dta"

** 1985-1993
import excel "D:\Documents\GitHub\Schroeder-et-al.-2021--How-long-do-pandemics-last-\Data\UK_Influenza\1985-1993-icd9b\icd9_b.xls", sheet("icd9_5") firstrow clear
save "D:\Documents\GitHub\Schroeder-et-al.-2021--How-long-do-pandemics-last-\Data\UK_Influenza\temp.dta", replace
import excel "D:\Documents\GitHub\Schroeder-et-al.-2021--How-long-do-pandemics-last-\Data\UK_Influenza\1985-1993-icd9b\icd9_b.xls", sheet("icd9_4") firstrow clear
append using "D:\Documents\GitHub\Schroeder-et-al.-2021--How-long-do-pandemics-last-\Data\UK_Influenza\temp.dta"
save "D:\Documents\GitHub\Schroeder-et-al.-2021--How-long-do-pandemics-last-\Data\UK_Influenza\temp.dta", replace
import excel "D:\Documents\GitHub\Schroeder-et-al.-2021--How-long-do-pandemics-last-\Data\UK_Influenza\1985-1993-icd9b\icd9_b.xls", sheet("icd9_3") firstrow clear
append using "D:\Documents\GitHub\Schroeder-et-al.-2021--How-long-do-pandemics-last-\Data\UK_Influenza\temp.dta"
keep if ICD_9 == "4870"| ICD_9 == "4871" | ICD_9 == "4878"
collapse (sum) ndths , by(yr sex age) 
save "D:\Documents\GitHub\Schroeder-et-al.-2021--How-long-do-pandemics-last-\Data\UK_Influenza\temp_10.dta"

** 1994-2000
import excel "D:\Documents\GitHub\Schroeder-et-al.-2021--How-long-do-pandemics-last-\Data\UK_Influenza\1994-2000-icd9c\icd9_c.xls", sheet("icd9_8") firstrow clear
save "D:\Documents\GitHub\Schroeder-et-al.-2021--How-long-do-pandemics-last-\Data\UK_Influenza\temp.dta", replace
import excel "D:\Documents\GitHub\Schroeder-et-al.-2021--How-long-do-pandemics-last-\Data\UK_Influenza\1994-2000-icd9c\icd9_c.xls", sheet("icd9_7") firstrow clear
append using "D:\Documents\GitHub\Schroeder-et-al.-2021--How-long-do-pandemics-last-\Data\UK_Influenza\temp.dta"
save "D:\Documents\GitHub\Schroeder-et-al.-2021--How-long-do-pandemics-last-\Data\UK_Influenza\temp.dta", replace
import excel "D:\Documents\GitHub\Schroeder-et-al.-2021--How-long-do-pandemics-last-\Data\UK_Influenza\1994-2000-icd9c\icd9_c.xls", sheet("icd9_6") firstrow clear
append using "D:\Documents\GitHub\Schroeder-et-al.-2021--How-long-do-pandemics-last-\Data\UK_Influenza\temp.dta"
keep if ICD_9 == "4870"| ICD_9 == "4871" | ICD_9 == "4878"
collapse (sum) ndths , by(yr sex age) 
save "D:\Documents\GitHub\Schroeder-et-al.-2021--How-long-do-pandemics-last-\Data\UK_Influenza\temp_11.dta"


** COMBINE
clear
cls
cd "D:\Documents\GitHub\Schroeder-et-al.-2021--How-long-do-pandemics-last-\Data\UK_Influenza\"
foreach w of numlist 1/11  {
	append using "temp_`w'.dta"
	erase temp_`w'
}
destring yr ,replace
merge 1:1 yr age sex using "D:\Documents\GitHub\Schroeder-et-al.-2021--How-long-do-pandemics-last-\Data\UK_Influenza\population.dta"
save "D:\Documents\GitHub\Schroeder-et-al.-2021--How-long-do-pandemics-last-\Data\UK_Influenza\Influenza_Dataset.dta", replace

collapse (sum) ndths population, by(yr sex)
gen rate = ndths/population*1000000	
