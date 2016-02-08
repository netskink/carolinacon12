#include <stdio.h>

int main(void) {

	char buf1[256] = "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA";
	char buf2[256] = "BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBA;

	void *p = &buf1;

	asm(
		"jmp *%0"
		:
		:"r"(p)
		);



}


