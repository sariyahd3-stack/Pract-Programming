#! /bin/bash 

########### GOAL OF PROGRAM IS TO CREATE AN ARRAY WITH THE FRUIT CONTAINED IN COLOUMN 1 OF MYFRUIT.TXT


#create variable FRUIT that holds the file name  
FRUIT="myfruit.txt"

#echo value of variable FRUIT
echo $FRUIT 

#cut column 1 from file, remove header, and redirect output to new variable 
cut -f1 $FRUIT | tail -n +2 > fruit_1.txt #is gonna hold all of our fruit values 

#cat fruit_1.txt
#cat fruit_1.txt
 
#create counter 
COUNTER=0 

#echo starting 
echo "creating array"

#while reading lines in the file fruit_1.txt that i just created 
while read LINE 
do 
	my_fruit[$COUNTER]=$LINE #populate the element w/ the value of line thats being read; creat array 
	#echo ${my_fruit[$COUNTER]} #echo the value of the element int thearray that i just created 
	let COUNTER=COUNTER+1 #increase the counter by 1 

done < fruit_1.txt #feed it the file and close the while loop

#################### CREATING ARRAY WITH YUM SCALE VALUES 
###################

#extract data in column 2 from FRUIT
cut -f2 $FRUIT | tail -n +2 > fruit_2.txt 

#reset COUNTER to 0 
COUNTER=0 

#while reading the line in the file fruit_2.txt
while read LINE 
do 
	yum_scale[$COUNTER]=$LINE #declare array yum_scale to cantain yum values from file
	#echo ${yum_scale[$COUNTER]} #echo the valiue of element in array to standard out  
	let COUNTER=COUNTER+1 #increment counter by 1 
done < fruit_2.txt #feed it the file to close the while loop

####### OPEN IF/ELSE LOOP TO RETURN ONLY YUMMY FRUIT TO STANDARD OUT 

#reset counter 
COUNTER=0  #because the postion in array will start with 0

#start a while loop to loop through the arrays 
while [ $COUNTER -lt ${#yum_scale[@]} ] # at means all values in array?, hashtag means want to see number #while value of COUNTER is less than value of array
do 
	if [ ${yum_scale[$COUNTER]} = "yummy" ]; then #if value in array is equal to ymmy  
		echo ${my_fruit[$COUNTER]} #echo value of array 
	else 
		echo "This fruit is not yummy" #echo this is not yummy
	fi #closes if/else loop
	let COUNTER=COUNTER+1  #incremetn counter
done #close while loop
