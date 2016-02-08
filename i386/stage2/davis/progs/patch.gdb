# mods for step 1
set var *((char *) 0xbffff35a) = 0x31
set var *((char *) 0xbffff35b) = 0xc0
set var *((char *) 0xbffff35c) = 0x89
set var *((char *) 0xbffff35d) = 0xc2
set var *((char *) 0xbffff35e) = 0x83
set var *((char *) 0xbffff35f) = 0xc0
set var *((char *) 0xbffff360) = 0xb
set var *((char *) 0xbffff361) = 0xcd
set var *((char *) 0xbffff362) = 0x80


# mods for step 2
# write the markers
set var *((unsigned int *) 0xbffff340) = 0x42424242
set var *((unsigned int *) 0xbffff344) = 0x43434343
set var *((unsigned int *) 0xbffff348) = 0x44444444
set var *((unsigned int *) 0xbffff34c) = 0x45454545
# write the strings to new location
set var *((unsigned int *) 0xbffff374) = 0x6e69622f
set var *((unsigned int *) 0xbffff378) = 0x0068732f
set var *((unsigned int *) 0xbffff37c) = 0xbffff340
set var *((unsigned int *) 0xbffff380) = 0x00000000


# mods for step 3
# ebx addr has moved to new address
set var *((unsigned int *) 0xbffff350) = 0xfff374bb
# ecx addr has moved to new address and triplet needs mod for address
#	ecx has moved to new address
set var *((unsigned int *) 0xbffff355) = 0xfff37cb9
#	cmd addr
set var *((unsigned int *) 0xbffff37c) = 0xbffff374

