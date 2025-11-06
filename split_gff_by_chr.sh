#!/bin/bash

#split_gff_by_chr.sh creats files for each chromosome ID into its own file 

#input file into variable 
FILE="/home/shared/FA25_coding/Exam_1/SLF_genomic.gff"

grep -v "^#" "$FILE" | cut -f1 | sort -u > chrid.txt #cut header from FILE show only chromosome IDs and sort them uniquely into file called chrid.txt

while read chr; do #while reading the first column defined by variable chr, count (# of appearences), and second column, chr (chromosome names) 
    
	grep -v "#" "$FILE" | grep -w "$chr" > "${chr}.gff" #have each value of variable chr (chromosome names) be created into a .gff file of its own
	echo "Wrote ${chr}.gff" #print status message to standard out after writing each .gff file 

done < chrid.txt #close loop 

#end of script
