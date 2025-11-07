#!/bin/bash
# summarize_split_gffs_simple.sh — counts gene, mRNA, exon from field 3 only

# Create output file with headers
echo -e "Chromosome\tgene\tmRNA\texon" > chromosome_summary.txt

# Loop through every .gff file created in Task 3
for file in *.gff; do #each file would represent a single chromosome from task 3 
    chr="$file"   # Save file name as chromosome label

    # Count only if column 3 equals "gene", "mRNA", or "exon"
    gene_count=$(cut -f3 "$file" | grep -w "^gene$" | wc -l) #varibale gene_count equals the number of time gene appears in the file 
    mrna_count=$(cut -f3 "$file" | grep -w "^mRNA$" | wc -l) #varibale mrna_count equals the number of time mRNA appears in the file
    exon_count=$(cut -f3 "$file" | grep -w "^exon$" | wc -l) #varibale exon_count equals the number of time exon appears in the file

    # Print results into the summary file using the value of each count, gene, mRNA, and exon in each .gff file for each chromosome 
    echo -e "${chr}\t\t${gene_count}\t${mrna_count}\t${exon_count}" >> chromosome_summary.txt #append to file chromosome_summary.txt
done #close loop

echo "Summary complete. Results saved in chromosome_summary.txt" #print completion status to standard out 

