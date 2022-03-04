# Avl_tree_balance_checker

A simple balance checker for testing your avl tree.

# How to use

```
git clone https://github.com/MouadDv/Avl_tree_balance_checker.git
cp avl.hpp .
cp pair.hpp .
sh generate.sh --help
```
After providing all the required arguments don't forget to edit avlreplace.cpp line 52 to properly insert new nodes in your tree.

```
vim +52 avlreplace.cpp
sh start.sh 50 4000
```

If your avl tree isn't properly balanced the program should output the unbalanced node with the tested values in a file named KO.txt.

# Requirement

- Your structure should contain an integer for storing the height (you can add it for the test).
- Your class must contain a way to insert new nodes (replace it in the generated file avlreplace.cpp).
- Make sure that all your attributes and methods are public.
