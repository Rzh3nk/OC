// fun.c
#include "fun.h"

size_t fibb(size_t n) {
  if (n==0) return 1;
  if (n==1) return 1;
  return fibb(n-2)+fibb(n-1);
}
