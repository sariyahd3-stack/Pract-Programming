#! /bin/bash 

#input file name in variable FILE 
FILE="/home/shared/FA25_coding/Exam_1/SLF_genomic.gff"

#count number of total features exluding header lines equal to variable TOTAL
TOTAL=$(grep -v "#" "$FILE" | cut -f3 | wc -l)

#excluding the header, single out only field containing type of feature, extract those containing corresponding feature (gene, mRNA, exon)  and count the occurances and then equal to corresponding variable 
GENES=$(grep -v "#" "$FILE" | cut -f3 | grep -w "gene" | wc -l) 
MRNA=$(grep -v "#" "$FILE"| cut -f3 | grep -w "mRNA" | wc -l)
EXON=$(grep -v "#" "$FILE" | cut -f3 | grep -w "exon" | wc -l)

echo -e "Total number of features: $TOTAL" #report the total number of features that exist to standard out 
echo -e "gene:\t$GENES" #report the ammount of features that are gene from corresponding variable, seperated by tab character to standard out 
echo -e "mRNA:\t$MRNA" #report the ammount of features that are mRNA from corresponding variable, seperated by tab character to standard out 
echo -e "exon:\t$EXON" #report the ammount of features that are exon from corresponding variable, seperated by tab character to standard out 
