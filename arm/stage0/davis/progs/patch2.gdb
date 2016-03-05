# fix up the svc 1 to svc 0
#set var *(char *)  0x7efff6d7 = 0
#set var *(char *)  0x7efff6c4 = 0
set var *(char *)  0x7efff6c2 = 0


# fix up the null term byte on "/bin/sh"
#set var *(char *) 0x7efff6cf = 0
#set var *(char *) 0x7efff6d1 = 0
set var *(char *) 0x7efff6cf = 0


# dump the r1 register which points to the "/bin/sh"
#x/8xb 0x7efff6c8
#x/8xb 0x7efff6ca
x/8xb 0x7efff6c8


# make sure we have a null pointer after the string
set var *(unsigned int *)  0x7efff6d0 = 0
#set var *(char *)  0x7efff6d2 = 0
#set var *(char *)  0x7efff6d3 = 0
#set var *(char *)  0x7efff6d4 = 0
#set var *(char *)  0x7efff6d5 = 0
#set var *(char *)  0x7efff6d6 = 0
#set var *(char *)  0x7efff6d7 = 0
#set var *(char *)  0x7efff6d8 = 0
#set var *(char *)  0x7efff6d9 = 0
#set var *(char *)  0x7efff6d0 = 0
#set var *(char *)  0x7efff6d1 = 0
#set var *(char *)  0x7efff6d2 = 0
#set var *(char *)  0x7efff6d3 = 0
#set var *(char *)  0x7efff6d4 = 0
#set var *(char *)  0x7efff6d5 = 0
#set var *(char *)  0x7efff6d6 = 0
#set var *(char *)  0x7efff6d7 = 0
#set var *(char *)  0x7efff6d8 = 0

# dump the null pointer
#x/1xw 0x7efff6dc
x/1xw 0x7efff6d2

