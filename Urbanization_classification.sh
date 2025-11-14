#!/bin/bash
################# prompt: bash script called "Urbanization_classification.sh" that classifies each sit as either rural, suburban, or urban

#input file into variable 
FILE="/home/shared/FA25_coding/Exam_2/Exam2_Levine_et_al_body_size.csv"

#creat output file and equal it to variable OUTPUT
OUTPUT="urban_class.txt"


#echo header of the table, the site code and class with tab
echo -e  "Site_Code\tClass" > "$OUTPUT" #echo header of table "Site_Codes    Class" 

tail -n +2 "$FILE" | while read -r LINE #remove header from input file, FILE; while reading each line 
do 
	SITE=$(echo "$LINE" | cut -d ',' -f2) #extract all the site codes from field 2 equal it to the variabel SITE 
	
	PERCENT=$(echo "$LINE" | cut -d ',' -f5 | tr -d ' \r') #extract the percentages from field 5 and remove and spaces and equal it to the varible PERCENT
	
	if  grep -q "$SITE" "$OUTPUT"; then #if the value of SITE is already in the output file, then
	
		continue #skip to the next line 
	
	fi #close if loop

	if [ "$PERCENT" -lt 15 ]; then #if percent is less than 15 then  
		
		CLASS="Rural" #classify as rural 

	elif [ "$PERCENT" -ge 50 ]; then #else greater than or equal to 50 then

		CLASS="Urban" #classify as Urban

	else #else percent 15-49 then  

		CLASS="Suburban"  #classify as Suburban

	fi #close if/elif/then loop

	echo -e "${SITE}\t${CLASS}" >> "$OUTPUT"  #print as a 2 coulumn table that includes the site code and the classification for each site represented by the variables SITE and CLASS

done #close while  loop 

#end of script 

