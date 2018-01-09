#!/bin/bash

# Array of help commands
help_menu=(
	"reverse [string] - Reverses a string using loops and variables",
	"fungame - Play a game where you guess a number [0-9], Win by guessing correctly"
)

# Clear the screen to begin with.
clear

# Command line variables, Comments and MultiLine Comments
<< CommandLineVars
	Command line variables are defined by $1-9
	eg: ./basics.sh hello world
	where "hello" would be stored in $1 and "world" would be $2
	$0 contains the name of the program being ran
CommandLineVars

# -z checks that the string is 0 characters long, or empty
# another way is to use OP commands such as -eq to check for values
# other OP commands are -ne, -lt, -le, -gt, -ge. 
# They are similar to Assembly where ne is not equal, lt is less than, gt is
# greater than and -ge greater than or equal to. 

if [ -z $1 ] || [ $# -eq 0 ]; then
	printf "Welcome to the basics. \n\tType $0 help or $0 ? to learn more about this program\n\n"
fi

# foreach loop that stores the current element in the $i variable
if [ "$1" = "help" ] || [ "$1" = "?" ]; then
	printf "Help Menu\n"
	for i in "${help_menu[@]}"; do
		printf "\t$i\n"
	done
fi

# more traditional forloop 
if [ "$1" = "reverse" ]; then 
	let sData=$2
	let sReversed=""

	for(( i=${#sData}; i>=0; i-- )); do
		sReversed=$sReversed${sData:$i:1}
	done

	printf "$sData reversed is $sReversed\n";
fi

# Whileloop in bash
if [ "$1" = "fungame" ]; then
	# loop control
	let bWon=0 # 0 FALSE , 1 TRUE
	let iRange=10 # Max Range
	while [ $bWon -eq 0 ]; do
		# Generate a random number and modulo it to get a number between
		# the range
		let iRandom=($RANDOM % $iRange)
		printf "debug number is $iRandom debug\n"
		printf "Enter a number between 0 and 9 inclusive: "
		read guess
		if [ $guess -eq $iRandom ]; then
			printf "Well done! you won!, the number was indeed $guess\n"
			bWon=1 #Could use exit 0 here also
		else
			printf "Sorry try again\n"
		fi
	done
fi


