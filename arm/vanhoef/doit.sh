#!/bin/bash

# this is straight from his guide.

# For reference, this is what worked for the qemu-testing image.
#qemu-system-arm -M integratorcp -kernel zImage.integrator -initrd arm_root.img

# Create the hard disk
#qemu-img create -f raw hda.img 3G

# This starts a debian installer.  It took about 1.5 hours to install
# on a core2duo
#qemu-system-arm -M vexpress-a9 -kernel vmlinuz-3.2.0-4-vexpress -initrd initrd.gz -append "root=/dev/mmcblk0" -drive if=sd,cache=unsafe,file=hda.img

# copy the instal iamge result to a new rootfs
#mkdir mountdir
#sudo mount -o loop,offset=$((512*2048)) hda.img mountdir/
#sudo cp mountdir/initrd.img-3.2.0-4-vexpress .
#sudo umount mountdir/

# Boot the installed image.  This failed.  The error is that it needs
# the kernel from that same file system in order to complete the init script.
#qemu-system-arm -M vexpress-a9 -kernel vmlinuz-3.2.0-4-vexpress -initrd initrd.img-3.2.0-4-vexpress -append "root=/dev/mmcblk0p2" -drive if=sd,cache=unsafe,file=hda.img

# This works, but I'm going to fix the above script so it works using
# his syntax.
#qemu-system-arm -M vexpress-a9 -kernel myvmlinuz -initrd myinitrd -append "root=/dev/mmcblk0p2" -drive if=sd,cache=unsafe,file=hda.img



#mkdir mountdir
#sudo mount -o loop,offset=$((512*2048)) hda.img mountdir/
#sudo cp mountdir/initrd.img-3.2.0-4-vexpress .
#sudo cp mountdir/vmlinuz-3.2.0-4-vexpress .
#sudo umount mountdir/

# boot the installed image
qemu-system-arm -M vexpress-a9 -kernel vmlinuz-3.2.0-4-vexpress -initrd initrd.img-3.2.0-4-vexpress -append "root=/dev/mmcblk0p2" -drive if=sd,cache=unsafe,file=hda.img
