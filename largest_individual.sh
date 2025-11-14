#!/bin/bash
################# prompt: bash script called "largest_individual.sh" that produces larfgest male, female and whether collected from same site 

#input file into variable 
FILE="/home/shared/FA25_coding/Exam_2/Exam2_Levine_et_al_body_size.csv"

#creat output file and equal it to variable OUTPUT
OUTPUT="large_indi.txt"

LONGEST_MALE=0 #set variable called longest male to 0
LONGEST_MALE_SITE="" #create a variable called longest male site equal to empty  

LONGEST_FEMALE=0 #set variable called longest female to 0
LONGEST_FEMALE_SITE="" #create a variable called longest female site equal to empty 

# Read file line by line, skip header
 while read -r LINE; do

    # Extract fields using cut
    SEX=$(echo "$LINE" | cut -d',' -f3)  #extract the sex from field 3 and equal it to the variable SEX 
    LENGTH=$(echo "$LINE" | cut -d',' -f4 | tr -d ' \r') #extract the length from field 4 and equal it to the variable LENGHT 
    SITE=$(echo "$LINE" | cut -d',' -f2) #extract the SITE from field 2 and equal it to the variable SITE 

    # If male, check if length is bigger than current longest male we have already recorded 
    if [ "$SEX" = "M" ]; then 
       
	 if [ "$LENGTH" -gt "$LONGEST_MALE" ]; then #if it is greater than longest male we have recorded then 
        
	    LONGEST_MALE=$LENGTH #equal the variable LONGEST_MALE to the value of LENGTH which will record the legngth of this male  
        
	    LONGEST_MALE_SITE=$SITE #record the site this longest male came from
        
	fi #close if loop

    fi #close if loop

    # If female, check if length is bigger than current longest female we have already recorded 
    if [ "$SEX" = "F" ]; then
       
	 if [ "$LENGTH" -gt "$LONGEST_FEMALE" ]; then #if
 
            LONGEST_FEMALE=$LENGTH #equal the variable LONGEST_FEMALE to the value of LENGTH which will record the legngth of this female
        
	    LONGEST_FEMALE_SITE=$SITE #record the site this longest female came from
       
	 fi #close if loop

    fi #close if loop

done < <(tail -n +2 "$FILE")  #close while loop, skipping header 

######################
############ After loop completes, write results

{
    echo "Longest Male Length: $LONGEST_MALE" #echo the value of the longest male, which would be its length
    echo "Collected From Site: $LONGEST_MALE_SITE" #echo the site that the longest male is from
    echo "" #line break
    echo "Longest Female Length: $LONGEST_FEMALE" #echo the value of the longest female, which would be its length 
    echo "Collected From Site: $LONGEST_FEMALE_SITE" #ehco the site that the longest female is from 
    echo "" #line break 
} > "$OUTPUT" #send all to the OUTPUT file 


###### 	ARE THEY FROM SAME SITE?
######### 

if [ "$LONGEST_MALE_SITE" = "$LONGEST_FEMALE_SITE" ]; then #if the site which the longest male came from equals the same site the longest female came from them 
    echo "Longest male and female were collected from the SAME site." >> "$OUTPUT" #echo that the longest male and longest female are from the SAME site
else
    echo "Longest male and female were collected from DIFFERENT sites." >> "$OUTPUT" #else echo that the longest man and longest female are from different sites
fi #close if/else loop

echo "Analysis complete. Output saved to $OUTPUT" #echo that the script was completed and everything is sent to the OUTPUT file to standard out 

