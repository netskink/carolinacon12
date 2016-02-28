#include <stdio.h>
#include <string.h>
#include <stdlib.h>

int main(int argc, char **argv) {
//	char buffer[256];
	char buffer[64]; // the shell code is 57 bytes
	if (argc !=2) {
		exit(0);
	}
// take out his printf so I don't have to type 
// refresh all the time.
//	printf("%p\n", buffer);
	strcpy(buffer, argv[1]);
// take out his printf so I don't have to type 
// refresh all the time.
//	printf("%s\n", buffer);
	return 0;
}
