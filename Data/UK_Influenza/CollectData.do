clear
cls

** 1900-1910
import excel "1901-1910-icd1\icd1.xls", sheet("ICD1") firstrow clear
gen influenza = ndths if icd_1  == "0120"
gen pneumonia = ndths if icd_1  == "0360" | icd_1  == "0370" | icd_1  == "0380" | icd_1  == "0390"
gen bronchitis = ndths if icd_1  == "1180"
collapse (sum) influenza pneumonia bronchitis , by(yr sex age) 
save "temp_1.dta"

** 1911-1920

import excel "1911-1920-icd2\icd2.xls", sheet("icd2_2") firstrow clear
save "temp.dta" , replace
import excel "1911-1920-icd2\icd2.xls", sheet("icd2_1") firstrow clear
append using "temp.dta"
gen influenza = ndths if  ICD_ == "10"
gen pneumonia = ndths if  ICD_ == "92A"|ICD_ == "92B"|ICD_ == "94C"
gen bronchitis = ndths if  ICD_ == "89&90A"|ICD_ == "89&90B"
gen bronchopneumonia = ndths if  ICD_ == "91"

collapse (sum) influenza pneumonia bronchitis bronchopneumonia, by(yr sex age) 
save "temp_2.dta"

** 1921-1930

import excel "1921-1930-icd3\icd3.xls", sheet("icd3_2") firstrow clear
save "temp.dta", replace
import excel "1921-1930-icd3\icd3.xls", sheet("icd3_1") firstrow clear
append using "temp.dta"
gen influenza = ndths if strmatch(ICD_3, "11a*") | strmatch(ICD_3, "11b*")
gen pneumonia = ndths if  ICD_3 == "101a"|ICD_3 == "101b"|ICD_3 == "107a"
gen bronchitis = ndths if  ICD_3 == "99c,99d"|ICD_3 == "99a"|ICD_3 == "99b"
gen bronchopneumonia = ndths if  ICD_3 == "100"
collapse (sum) influenza pneumonia bronchitis bronchopneumonia , by(yr sex age) 
save "temp_3.dta"

** 1931-1939

import excel "1931-1939-icd4\icd4.xls", sheet("icd4_2") firstrow clear
save "temp.dta", replace
import excel "1931-1939-icd4\icd4.xls", sheet("icd4_1") firstrow clear
append using "temp.dta"
gen influenza = ndths  if strmatch(ICD_4, "11a*") | strmatch(ICD_4, "11b*")
gen pneumonia = ndths if  ICD_4 == "108"|ICD_4 == "109"|ICD_4 == "114a"
gen bronchitis = ndths if  ICD_4 == "106a"|ICD_4 == "106b"|ICD_4 == "106c"
gen bronchopneumonia = ndths if  ICD_4 == "107"
collapse (sum) influenza pneumonia bronchitis bronchopneumonia , by(yr sex age) 
save "temp_4.dta"

** 1940-1949

import excel "1940-1949-icd5\icd5.xls", sheet("icd5_2") firstrow clear
save "temp.dta", replace
import excel "1940-1949-icd5\icd5.xls", sheet("icd5_1") firstrow clear
append using "temp.dta"
gen influenza = ndths if strmatch(ICD_5, "33a*") | strmatch(ICD_5, "33b*")
gen pneumonia = ndths if  strmatch(ICD_5, "108*")| strmatch(ICD_5, "109*") | ICD_5 == "114e(1)"
gen bronchitis = ndths if  ICD_5 == "106a"|ICD_5 == "106b"|ICD_5 == "106c"
gen bronchopneumonia = ndths if strmatch(ICD_5, "107*")
collapse (sum) influenza pneumonia bronchitis bronchopneumonia , by(yr sex age) 
save "temp_5.dta"

** 1950-1957

import excel "1950-1957-icd6\icd6.xls", sheet("icd6_2") firstrow clear
save "temp.dta", replace
import excel "1950-1957-icd6\icd6.xls", sheet("icd6_1") firstrow clear
append using "temp.dta"
gen influenza = ndths if ICD_6 == "4800" | ICD_6 == "4810"|ICD_6 == "4811"| ICD_6 == "4820"| ICD_6 == "4830"
gen pneumonia = ndths if ICD_6 == "4900" | ICD_6 == "4920"|ICD_6 == "4930"|ICD_6 == "5250"|ICD_6 == "7630"|ICD_6 == "7635"
gen bronchitis = ndths if ICD_6 == "5000" | ICD_6 == "5010"|ICD_6 == "5020"| ICD_6 == "5021"
gen bronchopneumonia = ndths if ICD_6 == "4910" 
collapse (sum) influenza pneumonia bronchitis bronchopneumonia , by(yr sex age) 
save "temp_6.dta"

** 1958-1967

import excel "1958-1967-icd7\icd7.xlsx", sheet("icd7_3") firstrow clear
save "temp.dta", replace
import excel "1958-1967-icd7\icd7.xlsx", sheet("icd7_2") firstrow clear
append using "temp.dta"
save "temp.dta", replace
import excel "1958-1967-icd7\icd7.xlsx", sheet("icd7_1") firstrow clear
append using "temp.dta"
gen influenza = ndths if ICD_7 == "4800" | ICD_7 == "4810"|ICD_7 == "4820"| ICD_7 == "4830"
gen pneumonia = ndths if ICD_7 == "4900" | ICD_7 == "4920"|ICD_7 == "4930"|ICD_7 == "5250"|ICD_7 == "7630"|ICD_7 == "7635"
gen bronchopneumonia = ndths if ICD_7 == "4910" 
gen bronchitis = ndths if ICD_7 == "5000" | ICD_7 == "5010"|ICD_7 == "5020"| ICD_7 == "5021"

collapse (sum) influenza pneumonia bronchitis bronchopneumonia , by(yr sex age) 
save "temp_7.dta"

** 1968-1978

import excel "1968-1978-icd8\icd8.xls", sheet("icd8_3") firstrow clear
save "temp.dta", replace
import excel "1968-1978-icd8\icd8.xls", sheet("icd8_2") firstrow clear
append using "temp.dta"
save "temp.dta", replace
import excel "1968-1978-icd8\icd8.xls", sheet("icd8_1") firstrow clear
append using "temp.dta"
gen influenza = ndths if ICD_8 == "4700"| ICD_8 == "4710" | ICD_8 == "4720"|ICD_8 == "4730"| ICD_8 == "4740"| ICD_8 == "7612"
gen pneumonia = ndths if ICD_8 == "4800" | ICD_8 == "4810"|ICD_8 == "4820"|ICD_8 == "4821"|ICD_8 == "4822"|ICD_8 == "4823"|ICD_8 == "4829"|ICD_8 == "4830"|ICD_8 == "4840"|ICD_8 == "4860"|ICD_8 == "5170"
gen bronchitis = ndths if ICD_8 == "4660" | ICD_8 == "4900" | ICD_8 == "4910"|ICD_8 == "5020"| ICD_8 == "5021"
gen bronchopneumonia = ndths if ICD_8 == "4850" 

collapse (sum) influenza pneumonia bronchitis bronchopneumonia , by(yr sex age) 
save "temp_8.dta"

** 1979-1984
import excel "1979-1984-icd9a\icd9_a.xlsx", sheet("icd9_2") firstrow clear
save "temp.dta", replace
import excel "1979-1984-icd9a\icd9_a.xlsx", sheet("icd9_1") firstrow clear
append using "temp.dta"
gen influenza = ndths if ICD_9 == "4870"| ICD_9 == "4871" | ICD_9 == "4878"
gen pneumonia = ndths if ICD_9 == "4800"|ICD_9 == "4801"|ICD_9 == "4802"|ICD_9 == "4808"|ICD_9 == "4809"|ICD_9 == "4810"|ICD_9 == "4820"|ICD_9 == "4821"|ICD_9 == "4822"|ICD_9 == "4823"|ICD_9 == "4824"|ICD_9 == "4828"|ICD_9 == "4829"|ICD_9 == "4830"|ICD_9 == "4840"|ICD_9 == "4841"|ICD_9 == "4842"|ICD_9 == "4843"|ICD_9 == "4844"|ICD_9 == "4845"|ICD_9 == "4846"|ICD_9 == "4847"|ICD_9 == "4848"|ICD_9 == "4860"|ICD_9 == "5171"
gen bronchopneumonia = ndths if ICD_9 == "4850" 
gen bronchitis = ndths if ICD_9 == "4900"|ICD_9 == "4910"|ICD_9 == "4911"|ICD_9 == "4912"|ICD_9 == "4918"|ICD_9 == "4919"
collapse (sum) influenza pneumonia bronchitis bronchopneumonia , by(yr sex age) 
save "temp_9.dta"

** 1985-1993
import excel "1985-1993-icd9b\icd9_b.xls", sheet("icd9_5") firstrow clear
save "temp.dta", replace
import excel "1985-1993-icd9b\icd9_b.xls", sheet("icd9_4") firstrow clear
append using "temp.dta"
save "temp.dta", replace
import excel "1985-1993-icd9b\icd9_b.xls", sheet("icd9_3") firstrow clear
append using "temp.dta"
gen influenza = ndths if ICD_9 == "4870"| ICD_9 == "4871" | ICD_9 == "4878"
gen pneumonia = ndths if ICD_9 == "4800"|ICD_9 == "4801"|ICD_9 == "4802"|ICD_9 == "4808"|ICD_9 == "4809"|ICD_9 == "4810"|ICD_9 == "4820"|ICD_9 == "4821"|ICD_9 == "4822"|ICD_9 == "4823"|ICD_9 == "4824"|ICD_9 == "4828"|ICD_9 == "4829"|ICD_9 == "4830"|ICD_9 == "4840"|ICD_9 == "4841"|ICD_9 == "4842"|ICD_9 == "4843"|ICD_9 == "4844"|ICD_9 == "4845"|ICD_9 == "4846"|ICD_9 == "4847"|ICD_9 == "4848"|ICD_9 == "4860"|ICD_9 == "5171"
gen bronchopneumonia = ndths if ICD_9 == "4850" 
gen bronchitis = ndths if ICD_9 == "4900"|ICD_9 == "4910"|ICD_9 == "4911"|ICD_9 == "4912"|ICD_9 == "4918"|ICD_9 == "4919"
collapse (sum) influenza pneumonia bronchitis bronchopneumonia , by(yr sex age) 
save "temp_10.dta"

** 1994-2000
import excel "1994-2000-icd9c\icd9_c.xls", sheet("icd9_8") firstrow clear
save "temp.dta", replace
import excel "1994-2000-icd9c\icd9_c.xls", sheet("icd9_7") firstrow clear
append using "temp.dta"
save "temp.dta", replace
import excel "1994-2000-icd9c\icd9_c.xls", sheet("icd9_6") firstrow clear
append using "temp.dta"
gen influenza = ndths if ICD_9 == "4870"| ICD_9 == "4871" | ICD_9 == "4878"
gen pneumonia = ndths if ICD_9 == "4800"|ICD_9 == "4801"|ICD_9 == "4802"|ICD_9 == "4808"|ICD_9 == "4809"|ICD_9 == "4810"|ICD_9 == "4820"|ICD_9 == "4821"|ICD_9 == "4822"|ICD_9 == "4823"|ICD_9 == "4824"|ICD_9 == "4828"|ICD_9 == "4829"|ICD_9 == "4830"|ICD_9 == "4840"|ICD_9 == "4841"|ICD_9 == "4842"|ICD_9 == "4843"|ICD_9 == "4844"|ICD_9 == "4845"|ICD_9 == "4846"|ICD_9 == "4847"|ICD_9 == "4848"|ICD_9 == "4860"|ICD_9 == "5171"
gen bronchopneumonia = ndths if ICD_9 == "4850" 
gen bronchitis = ndths if ICD_9 == "4900"|ICD_9 == "4910"|ICD_9 == "4911"|ICD_9 == "4912"|ICD_9 == "4918"|ICD_9 == "4919"
collapse (sum) influenza pneumonia bronchitis bronchopneumonia , by(yr sex age) 
save "temp_11.dta"


** COMBINE
clear
cls
cd ""
foreach w of numlist 1/11  {
	append using "temp_`w'.dta"
	erase "temp_`w'.dta"
}
destring yr sex,replace
merge 1:1 yr age sex using "population.dta"
save "Disease_Dataset.dta", replace

** EXPORT
clear
cls
use  "Disease_Dataset.dta"

preserve
collapse (sum) influenza pneumonia bronchitis bronchopneumonia population, by(yr sex)
gen influenza_rate = influenza/population*1000000	
gen pneumonia_rate = pneumonia/population*1000000	
gen bronchitis_rate = bronchitis/population*1000000	
gen bronchopneumonia_rate = bronchopneumonia/population*1000000	
export excel yr influenza_rate pneumonia_rate bronchitis_rate bronchopneumonia_rate if sex ==1 using "Mortality_Rate_by_Gender.xlsx", sheet("Male")  firstrow(variables)  sheetreplace
export excel yr influenza_rate pneumonia_rate bronchitis_rate bronchopneumonia_rate if sex ==2 using "Mortality_Rate_by_Gender.xlsx", sheet("Female") firstrow(variables)   sheetreplace
restore
collapse (sum) influenza pneumonia bronchitis bronchopneumonia population, by(yr)
gen influenza_rate = influenza/population*1000000	
gen pneumonia_rate = pneumonia/population*1000000	
gen bronchitis_rate = bronchitis/population*1000000	
gen bronchopneumonia_rate = bronchopneumonia/population*1000000	
export excel yr influenza_rate pneumonia_rate bronchitis_rate bronchopneumonia_rate using "Mortality_Rate_by_Gender.xlsx", sheet("Total")  firstrow(variables)  sheetreplace
