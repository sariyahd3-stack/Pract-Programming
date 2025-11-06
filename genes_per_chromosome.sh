#!/bin/bash
# genes_per_chromosome.sh — Counts number of genes per chromosome

#input file into variable 
FILE="/home/shared/FA25_coding/Exam_1/SLF_genomic.gff"

#echo the header "Chromosome   GeneCount"
echo -e "Chromosome\tGeneCount"

chromosome=($(grep -v "#" "$FILE" | cut -f1 | sort |uniq)) #create array called chromosme that  include and sorts unique chromosome names from column 1 of file inputed in variable FILE

#echo "${chromosome[@]}" #name chromosomes name to standard out  

for chr in "${chromosome[@]}" ; do #for every chromosome name
	count=$(grep -v "#" "$FILE" | grep -w "$chr" |cut -f3 | grep -w "gene" | wc -l) #create a varible called count that counts how many features which are in column 3 are of type "gene" 
	echo -e "${chr}\t${count}" #print as a two column table the chromosome name and it respective number of genes per chromosome, with a tab sperating the columns to standard out
done #close for loop 

#end of script 

