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
		printf "$YELLOW ------> $GREEN  argmount 1 is name of your root(avl_tree) $RESET \n "
		printf "$YELLOW ------> $GREEN  argmount 2 is name of your height(avl_tree) $RESET \n "
		printf "$YELLOW ------> $GREEN  argmount 1 is name of your right-node(avl_tree) $RESET \n "
		printf "$YELLOW ------> $GREEN  argmount 1 is name of your left-node(avl_tree) $RESET \n "
	fi
}


# function replace
# {

# }



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
	printf "$RED##############----- $RESET $YELLOW add --help for info $RESET $RED-----##########################$RESET\n"
	HELP $1
}


main $1 $2 $3 $4