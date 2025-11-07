#!/bin/bash

#input file into variable 
FILE="/home/shared/FA25_coding/Exam_1/SLF_genomic.gff"

#echo the header "Chromosome   GeneCount   Class"
echo -e "Chromosome\tGeneCount\tClass" > density_report.txt #create a file called density_report.txt with the header in it 

chromosome=($(grep -v "#" "$FILE" | cut -f1 | sort |uniq)) #the variable chromosome equals the chromosomes names from the input file sorted uniquely 

#echo "${chromosome[@]}" #echo chromosome names 

for chr in "${chromosome[@]}" ; do #for the value of every chromosome name in the variable chromosome 
	count=$(grep -v "#" "$FILE" | grep -w "$chr" |cut -f3 | grep -w "gene" | wc -l) #using the variable count, count all the times genes is a feature for each chromosome

	#echo -e "${chr}\t${count}" #echo both the chromosome name and its gene count

		if [ $count -gt 2000 ] ; then #if the number of genes is greater than 2000 #if the gne count it greater than 2000 then

                	class="High-Density" #classify the value  as high density #using the variable class classify it equal to High-Density 

        	else #if its not greater than 2000

                	class="Low-Density" #classify the value  as low density

        	fi #close if/else loop
       
	 echo -e "${chr}\t${count}\t${class}" >> density_report.txt  #echo the list into columns of the chromosome names, its gene count, and whether its high or low density and append it to the density_report.txt file 

done #close for loop 

echo "Completed density_report.txt" #print the completion of the for loop into the density_report.txt file 

#end of script 

