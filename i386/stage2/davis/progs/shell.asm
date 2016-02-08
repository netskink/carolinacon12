# shell.asm
	global _start

_start:
	lea eax, [rel buf]
	push esp
	mov eax, 0x0B
	push eax
	syscall
	
buf: db '/bin/sh',0

