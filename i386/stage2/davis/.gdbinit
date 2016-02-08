# this does not work on the arm implementation or debian.
# Literraly do a help set a<tab> and it does not show up
# as one of the possible commands.
#set auto-load safe-path ~/progs

# sadly this does not work on my arm implementation
# but on x64 it is incompatible with -tui
# so need to remove any layout commands
# from the local .gdbinit
# source ~/progs/Gdbinit/gdbinit
add-auto-load-safe-path /home/davis/progs/.gdbinit

