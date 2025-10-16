#! /bin/bash 

#set a counter equal to zero and a counter equal to 10 
COUNTER1=0 
COUNTER2=10 

#while the value of my counter is less than 150
while [ $COUNTER1 -lt 150 ]
do 
	my_array[$COUNTER1]=$COUNTER2 #populate element whith value of counter
	echo ${my_array[$COUNTER1]} >> my_array_list2.txt #echo the value that is in that cell at that time to a file
	let COUNTER1=COUNTER1+1 #increase the counter by 1

done #close the while loop 


