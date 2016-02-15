#!/bin/bash

# Rather than build seperate scripts, this is one big script
# with stages.  Its pretty simple, uncomment out the making of 
# a disk image and the exit to stop the script at that stage.
# When that is done, readd the comments and uncomment the next step. 
# Repeat.

# There was a lot of stuff I was trying and its left in here
# so I can resume it later.

# make a disk image
#qemu-img create -f qcow hda.img 10G
#exit


#install
qemu-system-i386 -boot d -cdrom archlinux-2015.12.01-dual.iso -m 512 -hda hda.img
#exit

# fsck this. Lets try this
# From the host, do :
# $ ssh davis@localhost -p 2222
# to get a shell on the guest.
#qemu-system-i386 hda.img -m 512 -redir tcp:2222::22
#exit

# This allows two networking between the guest and host.  Need to
# run the do_networking.sh script first.
#qemu-system-i386 hda.img -m 512 -netdev tap,id=t0,ifname=tap0,script=no,downscript=no -device e1000,netdev=t0,id=nic0
exit


