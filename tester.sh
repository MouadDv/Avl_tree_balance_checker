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

function HELP
{
	if [ "$1" == "--help" ];
	then
		printf "$YELLOW ------> $GREEN  argmount 1 is name of your root(avl_tree) ex : test.root ==> pointer of ur node :D $RESET \n "
		printf "$YELLOW ------> $GREEN  argmount 2 is name of your height(avl_tree) ex : just name for ur name height $RESET \n "
		printf "$YELLOW ------> $GREEN  argmount 3 is name of your right-node(avl_tree) ex: just name of  right-node $RESET \n "
		printf "$YELLOW ------> $GREEN  argmount 4 is name of your left-node(avl_tree) ex: just name  of left-node  $RESET \n "
		printf "$YELLOW ------> $GREEN  argmount 5 is name of your pair-name(avl_tree) ex: just name  of pair  $RESET \n "
		printf "$YELLOW ------> $GREEN  argmount 6 is name of your hederfile-name(avl_tree) ex: just name  of header-file ex2: my-avl.hpp  $RESET \n "
		printf "$YELLOW after all change u can run test \n"
	fi
}


function replace
{
	printf " $RESET ****************** start change name of  test_avl "
	if [ -z "$6" ];
	then
		printf "\n $RED ---------------------------  ERROR : one of argmount  is empty\n $RESET"
	else 
		printf "start replace\n"
		sed 's/test.root/$1/g' testingavl.cpp | sed 's/h0/$2/g' testingavl.cpp | sed  's/r0/$3/g' testingavl.cpp | sed  's/l0/$4/g' testingavl.cpp | sed  's/val0/$5/g'  testingavl.cpp | sed 's/avl.hpp/$6/g' testingavl.cpp  > avl_test_rplace.cpp
	fi
}



function test_avl
{
	i="0"
	while [ $i != $1 ];
	do
		ARG=$(python3 ./generate.py $2)
		printf "$YELLOW%s%d$RESET\n" "test for ===> " "$2"
		./a.out $ARG
		i=$[$i+1];
	done
}

# test_avl $1 $2




function main
{
	printf "$RED##################----- $RESET $YELLOW add --help for more info $RESET $RED-----##########################$RESET\n"
	HELP $1
	replace $1 $2 $3 $4 $5 $6
	printf "$RED##################----- $RESET $YELLOW end :p $RESET $RED-----##########################$RESET\n"

}


main $1 $2 $3 $4 $5 $6