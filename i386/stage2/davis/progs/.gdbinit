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
# args for bufferoverflow.c
#break main
#set args "AAAABBBBCCCC" > outfile.txt
#
# setup for testy1
file testy1
break 107



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
