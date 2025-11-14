#!/bin/bash
################# prompt: bash script called "Measurer_summary.sh" that classifies each measurer, the number of samples they collected and how many were either rural, suburban, or urban

#input file into variable 
FILE="/home/shared/FA25_coding/Exam_2/Exam2_Levine_et_al_body_size.csv"

#creat output file and equal it to variable OUTPUT
OUTPUT="measurer_summary.txt"


#echo header of the table,  with tab
echo -e  "Measurer\tSamples\tRural\tSuburban\tUrban" > "$OUTPUT"  

MEASURERS=$(tail -n +2 "$FILE" | cut -d ',' -f1 | tr -d ' \r' | sort | uniq) #remove header from input file, FILE, and get a unique list if measurer intitials; no spaces 

for M in $MEASURERS; do #for every measurer loop through set different COUNTERS 
	TOTAL=0      # Total samples set variable to 0 
        RURAL=0      # Number of rural samples set variable to 0 
        SUBURBAN=0   # Number of suburban samples set variable to 0 
        URBAN=0      # Number of urban samples set variable to 0 

#loop through lines in the input file in variable FILE 
	 while read -r LINE; do #while reading lines in input file  


		MEASURER=$(echo "$LINE" | cut -d ',' -f1 | tr -d ' \r') #extract all the measurer initials from field 1 equal it to the variabel MEASURERS  
	
		PERCENT=$(echo "$LINE" | cut -d ',' -f5 | tr -d ' \r') #extract the percentages from field 5 and remove and spaces and equal it to the varible PERCENT
		
		#only count samples for the current measurer 
		if  [ "$MEASURER" = "$M" ]; then 
			TOTAL=$((TOTAL + 1)) #set TOTAL counter ro itself + 1, increment total number of samples 

			#classift site based on %IP-5KM
			if [ "$PERCENT" -lt 15 ]; then #if percent is less than 15 then  
		
	                	RURAL=$((RURAL + 1)); #Increment rural counter  

			elif [ "$PERCENT" -ge 50 ]; then #else greater than or equal to 50 then

	                	URBAN=$((URBAN + 1))  #increment urban counter

			else #else percent 15-49 then  

				SUBURBAN=$((SUBURBAN + 1))  #increment Suburban counter
			fi #close if/elif/else loop

		fi #close if/elif/then loop

	done < <(tail -n +2 "$FILE") #feed the file lines to while loop, skipping the header 

	echo -e "${M}\t${TOTAL}\t${RURAL}\t${SUBURBAN}\t${URBAN}" >> "$OUTPUT"  #print as 5 column table containing the values for the measurer, the number of sampls meausered by each measurer, and the number measured by them that was either rural, urban, or suburban

done #close while  loop 

#end of script 

