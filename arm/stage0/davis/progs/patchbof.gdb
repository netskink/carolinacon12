# buffer in gdb is at 0x7efff6ac


# fix up the svc 1 to svc 0
set var *(char *)  0x7efff6c2 = 0


# fix up the null term byte on "/bin/sh"
set var *(char *) 0x7efff6cf = 0



# make sure we have a null pointer after the string
set var *(unsigned int *)  0x7efff6d0 = 0

# dump the string and null pointer
x/16 0x7efff6c8

