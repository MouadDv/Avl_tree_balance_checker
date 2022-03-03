#include <iostream>
#include <string>
#include "$6"

template<class F>
int calheight(F *p)
{
  if (p == NULL)
    return (1);
  if(p->l0 && p->r0)
  {
    if (p->l0->h0 < p->r0->h0)
      return p->r0->h0 + 1;
    else
      return  p->l0->h0 + 1;
  }
  else if(p->r0 == NULL && p->l0)
  {
    return p->l0->h0 + 1;
  }
  else if(p->l0 ==NULL && p->r0)
  {
    return p->r0->h0 + 1;
  }
  return 1;
}

template<class F>
void check_balance(F *s)
{
  if (s == nullptr)
    return ;
  if (s->r0)
    check_balance(s->r0);
  if (s->l0)
    check_balance(s->l0);
  int bal = ::calheight(s->l0) - ::calheight(s->r0);
  if (bal >= 2 || bal <= -2)
  {
    std::cout << "KO: " << " unbalanced tree at node " << s->val0.first << "\n";
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
