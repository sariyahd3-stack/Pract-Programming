#! /bin/bash

#add header line 
echo "These are my friends:" > myfriends.txt

# set a counter equal to 1 
COUNTER=1

# run for loop on list of friends
for FRIEND  in Elie Hasita Juhi Jon Lu Caroline #for variable friends  
do 
	echo $FRIEND >> myfriends.txt #echo value of friends to file
	echo "on friend number $COUNTER" >> myfriends.txt #echo what friend it on to file
	((COUNTER++))
done  

echo "For loop completed"

#decrease counter by 1 to get accurate number
((COUNTER-))

#echo total number of friends to file
echo "Total Number of Friends: $COUNTER" >> myfriends.txt


#echo completion to standard out
echo "Script completed"
