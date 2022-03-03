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
		printf "$YELLOW ------> $GREEN  argmount 1 is name of your hederfile-name(avl_tree) ex: just name  of header-file ex2: my-avl.hpp  $RESET \n "
		printf "$YELLOW ------> $GREEN  argmount 2 is name of your avl_tree structure ex: Avl or tree...  $RESET \n "
		printf "$YELLOW ------> $GREEN  argmount 3 is name of your root(avl_tree) ex : root ==> pointer of ur node :D $RESET \n "
		printf "$YELLOW ------> $GREEN  argmount 4 is name of your height(avl_tree) ex : just name for ur name height $RESET \n "
		printf "$YELLOW ------> $GREEN  argmount 5 is name of your right-node(avl_tree) ex: just name of  right-node $RESET \n "
		printf "$YELLOW ------> $GREEN  argmount 6 is name of your left-node(avl_tree) ex: just name  of left-node  $RESET \n "
		printf "$YELLOW ------> $GREEN  argmount 7 is name of your pair-name(avl_tree) ex: just name  of pair  $RESET \n "
		printf "$YELLOW ------> $GREEN  struct tree {
        	   typename ft::map<const T1, T2>::value_type pair;
        	   tree<T1, T2> *right-node;
        	   tree<T1, T2> *left-node;
        	   int height;
    		   };

    		   template <typename F, typename S>
    		   class avl_tree {
    		   public:
			   tree<F, S> *root;
		}$RESET \n "
		printf "$RED ------> Do not forget to edit avlreplace.cpp line 52 to insert a new node in your tree. test.insert(root, key); $RESET \n "

		printf "$YELLOW after all change u can run test \n"
	fi
}

function generatemainfile
{
	content="#include <iostream>
	#include <string>
#include \"$1\"

template<class F>
int calheight(F *p)
{
  if (p == NULL)
	return (1);
  if(p->$6 && p->$5)
  {
	if (p->$6->$4 < p->$5->$4)
	  return p->$5->$4 + 1;
	else
	  return  p->$6->$4 + 1;
  }
  else if(p->$5 == NULL && p->$6)
  {
	return p->$6->$4 + 1;
  }
  else if(p->$6 ==NULL && p->$5)
  {
	return p->$5->$4 + 1;
  }
  return 1;
}

template<class F>
void check_balance(F *s)
{
  if (s == nullptr)
	return ;
  if (s->$5)
	check_balance(s->$5);
  if (s->$6)
	check_balance(s->$6);
  int bal = ::calheight(s->$6) - ::calheight(s->$5);
  if (bal >= 2 || bal <= -2)
  {
	std::cerr << \"KO: \" << \" unbalanced tree at node \" << s->$7.first << std::endl;
	return ;
  }
}

int main(int ac, char **av)
{
  ft::$2<int, int> test;
  for (int i = 1; i < ac; i++) {
	std::string t(av[i]);
	ft::pair<const int, int> p1(std::stoi(t), 20);
	test.insert(test.$3, p1);
  }
  check_balance(test.$3);
}"
	printf "$content" > avlreplace.cpp
	printf "$RED ------> Do not forget to change this line to insert a new node in your tree. test.insert(root, key);$RESET \n "
}

function replace
{
	printf " $RESET ****************** start change name of  test_avl "
	if [ -z "$7" ];
	then
		printf "\n $RED ---------------------------  ERROR : one of argmount  is empty\n $RESET"
	else 
		printf "start replace\n"
		generatemainfile $1 $2 $3 $4 $5 $6 $7
	fi
}




# test_avl $1 $2




function main
{
	printf "$RED##################----- $RESET $YELLOW add --help for more info $RESET $RED-----##########################$RESET\n"
	HELP $1
	replace $1 $2 $3 $4 $5 $6 $7
	printf "$RED##################----- $RESET $YELLOW end :p $RESET $RED-----##########################$RESET\n"

}


main $1 $2 $3 $4 $5 $6 $7
