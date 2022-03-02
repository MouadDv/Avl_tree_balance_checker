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

test_avl $1 $2
