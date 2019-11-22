#include <stdio.h>
#include <string.h>
//#include "module.h"

#ifndef GIT_BRANCH_NAME
#define GIT_BRANCH_NAME "INIT VAL"
#endif

int main () {
    printf("Running main\n");
    printf("Compile started at: %s \n",VAR);
    printf("GIT Branch name: %s \n",GIT_BRANCH_NAME);
    printf("GIT Branch HASH: %s \n",GIT_BRANCH_HASH);
  //  module_run();
    printf("Changed on master on Nov 22 2019 at 8.29: %s \n",GIT_BRANCH_HASH);
    
      printf("Changed on master on Nov 22 2019 at 8.32: %s \n",GIT_BRANCH_HASH);
    
    
    
}
