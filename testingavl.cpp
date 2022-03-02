#include <iostream>
#include <string>
#include "avl.hpp"

template<class F>
int calheight(F *p)
{
  if (p == NULL)
    return (1);
  if(p->l && p->r)
  {
    if (p->l->h < p->r->h)
      return p->r->h + 1;
    else
      return  p->l->h + 1;
  }
  else if(p->r == NULL && p->l)
  {
    return p->l->h + 1;
  }
  else if(p->l ==NULL && p->r)
  {
    return p->r->h + 1;
  }
  return 1;
}

template<class F>
void check_balance(F *s)
{
  if (s == nullptr)
    return ;
  if (s->r)
    check_balance(s->r);
  if (s->l)
    check_balance(s->l);
  int bal = ::calheight(s->l) - ::calheight(s->r);
  if (bal >= 2 || bal <= -2)
  {
    std::cout << "KO: " << " unbalanced tree at node " << s->val.first << "\n";
    return ;
  }
}

int main(int ac, char **av)
{
  ft::Avl<int, int> test;
  for (int i = 1; i < ac; i++) {
    std::string t(av[i]);
    ft::pair<const int, int> p1(std::stoi(t), 20);
    test.insert(&(test.root), p1);
  }
  check_balance(test.root);
}
