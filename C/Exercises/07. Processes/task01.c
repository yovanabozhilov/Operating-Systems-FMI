#include <unistd.h>
#include <stdlib.h>
#include <err.h>
#include <stdio.h>

int main(void){
    if (execl("/bin/date", "date", (char*)NULL) == -1) {
        err(1, "err execling");
    } 
}

//T1 - Да се напише програма на C, която изпълнява команда date.
