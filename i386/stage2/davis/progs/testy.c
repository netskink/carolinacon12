#include <stdio.h>
#include <stdlib.h>

int global_init_var = 1;
int global_noninit_var;

void goo(void) {
	char *pBuffer = malloc(2);
	pBuffer[0] = (char) global_noninit_var ;
	pBuffer[1] = 0;	
	printf("buffer = %s\n", pBuffer);
	free(pBuffer);
}

void foo(int a) {
	global_noninit_var = a;
	goo();
}
void main(void) {
	int aLocal = 0x42;
	foo(aLocal);
}
