#!/bin/bash

RESET="\033[0m"
BLACK="\033[30m"
RED="\033[31m"
GREEN="\033[32m"
YELLOW="\033[33m"
BLUE="\033[34m"
MAGENTA="\033[35m"
CYAN="\033[36m"
WHITE="\033[37m"

function test_avl
{
	i="0"
    c++ avlreplace.cpp -o avldestroyer
	while [ $i != $1 ];
	do
		ARG=$(python3 ./values.py $2)
		printf "$YELLOW%s%d$RESET\n" "test for ===> " "$2"
		./avldestroyer $ARG
		i=$[$i+1];
	done
}

function start
{
	printf " $RESET starting the test\n"
	if [ -z "$2" ];
	then
		printf "\n $RED ---------------------------  ERROR : one of argmount  is empty\n $RESET"
	else
        test_avl $1 $2
	fi
}

function main
{
	printf "$RED##################----- $RESET $YELLOW USAGE: sh start.sh [number of tests] [range of numbers to be tested] $RESET $RED-----##########################$RESET\n"
	printf " $RESET Example: sh start.sh 50 300\n"
	start $1 $2
	printf "$RED##################----- $RESET $YELLOW end :p $RESET $RED-----##########################$RESET\n"

}

main $1 $2
