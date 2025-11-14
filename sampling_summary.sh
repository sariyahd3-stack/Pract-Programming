#!/bin/bash
################# prompt: bash script called "sampling_summary.sh"

#input file into variable 
FILE="/home/shared/FA25_coding/Exam_2/Exam2_Levine_et_al_body_size.csv"

#creat output file and equal it to variable OUTPUT
OUTPUT="sampling_summary.txt"

#remove header from FILE
tail -n +2 "$FILE" > tmp_sample.txt

#count unique sites and equal it to varible NUM_SITES
NUM_SITES=$( cut -d ',' -f2 tmp_sample.txt | sort | uniq | wc -l)


#echo the header "Number of sites:" including the variable NUM_SITES with the total number of unique sites in the file with tab  
echo -e "Number of sites:\t$NUM_SITES" > "$OUTPUT"

#echo header of the table, including, the site code, number of samples, number of males and females
echo -e  "Site_Code\tN_Samples\tN_Males\tN_Females" >> "$OUTPUT" #echo header of table site code, number of samples, number of males and felmales with tab 


for SITE in $(cut -d ',' -f2 tmp_sample.txt | sort -u) ; do #for every sorted unique SITE in the file tmp_sample.txt do
	SAMPLES=$(grep -c ",$SITE," tmp_sample.txt) #create a variable, SAMPLE, equal to the number of times each sample is repeated in the file  

	MALES=$(grep ",$SITE," tmp_sample.txt | grep -c ",M,") #create variable equal to the number of times M (males) are for each site

	FEMALES=$(grep ",$SITE," tmp_sample.txt |  grep -c ",F," ) #create variable equal to the number of times F (females) are in each site 

	echo -e "${SITE}\t\t${SAMPLES}\t\t${MALES}\t\t${FEMALES}" >> "$OUTPUT"  #print as a 4 coulmn table with the site code, number of samples for that site, number of male and females for that site with tabs

done #close for loop 

#end of script 

