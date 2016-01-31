//#include <stdio.h> // For printf
#include <unistd.h> // For execl

int main(void) {
	//execl("/bin/sh", "", NULL);
	execve("/bin/sh", NULL, NULL);
}

