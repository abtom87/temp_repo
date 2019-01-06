#include <stdio.h>
#include <string.h>
//#include "module.h"

#ifndef VAR
#define VAR "INIT VAL"
#endif

int main () {
    printf("Running main\n");
    printf("VAR: %s \n",VAR);
    printf("GIT Branch name: %s \n",GIT_BRANCH_NAME);
    printf("GIT Branch HASH: %s \n",GIT_BRANCH_HASH);
  //  module_run();
}
