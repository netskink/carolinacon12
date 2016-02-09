# mods for step 4
# write junk at this address, so we can ensure our
# patch writes correct value to this addr
set var *((unsigned int *) 0xbffff380) = 0x12345678

# write null ptr to 0xbffff380

# nasm
# mov    eax, 0xbffff380
# xor    ebx, ebx
# mov    [eax], ebx

# objdump
#   0:   b8 80 f3 ff bf          mov    $0xbffff380,%eax
#   5:   31 db                   xor    %ebx,%ebx
#   7:   89 18                   mov    %ebx,(%eax)

set var *((unsigned char *) 0xbffff340) = 0xb8
set var *((unsigned char *) 0xbffff341) = 0x80
set var *((unsigned char *) 0xbffff342) = 0xf3
set var *((unsigned char *) 0xbffff343) = 0xff
set var *((unsigned char *) 0xbffff344) = 0xbf
set var *((unsigned char *) 0xbffff345) = 0x31
set var *((unsigned char *) 0xbffff346) = 0xdb
set var *((unsigned char *) 0xbffff347) = 0x89
set var *((unsigned char *) 0xbffff348) = 0x18
# write nops to fill space between this new code and the start
# of our older existing code
set var *((unsigned char *) 0xbffff349) = 0x90
set var *((unsigned char *) 0xbffff34a) = 0x90
set var *((unsigned char *) 0xbffff34b) = 0x90
set var *((unsigned char *) 0xbffff34c) = 0x90
set var *((unsigned char *) 0xbffff34d) = 0x90
set var *((unsigned char *) 0xbffff34e) = 0x90
set var *((unsigned char *) 0xbffff34f) = 0x90

set var *((unsigned char *) 0xbffff348) = 0x18
# write new function pointer address, we now start at 0xbffff340
set var *((unsigned int *) 0xbffff370) = 0xbffff340

