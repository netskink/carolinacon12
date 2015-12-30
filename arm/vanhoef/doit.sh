#!/bin/bash

# this is straight from his guide.

# For reference, this is what worked for the qemu-testing image.
#qemu-system-arm -M integratorcp -kernel zImage.integrator -initrd arm_root.img

# Create the hard disk
#qemu-img create -f raw hda.img 3G

# This starts a debian installer.  It took about 1.5 hours to install
# on a core2duo
#qemu-system-arm -M vexpress-a9 -kernel vmlinuz-3.2.0-4-vexpress -initrd initrd.gz \
#-append "root=/dev/mmcblk0" -drive if=sd,cache=unsafe,file=hda.img 

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
# sudo qemu-system-arm -M vexpress-a9 -kernel vmlinuz-3.2.0-4-vexpress -initrd initrd.img-3.2.0-4-vexpress -append "root=/dev/mmcblk0p2" -drive if=sd,cache=unsafe,file=hda.img


# boot the installed image wih network bridge
# Below here are the last set of attempts to get
# host only networking working.  None of these worked.


# This does not work
#sudo qemu-system-arm -M vexpress-a9 -kernel vmlinuz-3.2.0-4-vexpress \
#-initrd initrd.img-3.2.0-4-vexpress -append "root=/dev/mmcblk0p2" \
#-drive if=sd,cache=unsafe,file=hda.img \
#-net nic,macaddr=00:16:3e:00:00:02 -net tap,script=no,downscript=no

# This is from vanhoef, but it does not work.
#sudo qemu-system-arm -M vexpress-a9 -kernel vmlinuz-3.2.0-4-vexpress \
#-initrd initrd.img-3.2.0-4-vexpress -append "root=/dev/mmcblk0p2" \
#-drive if=sd,cache=unsafe,file=hda.img \
#-net nic -net tap,ifname=qtap0,script=no,downscript=no


# This is the model used for i386 which does work
#sudo qemu-system-arm -M vexpress-a9 -kernel vmlinuz-3.2.0-4-vexpress \
#-initrd initrd.img-3.2.0-4-vexpress -append "root=/dev/mmcblk0p2" \
#-drive if=sd,cache=unsafe,file=hda.img \
#-netdev tap,id=t0,ifname=tap0,script=no,downscript=no \
#-device virtio-net-device,netdev=t0,id=nic0

# This is using the method which worked for fedora.
# !!!
# And it works for this image.
# !!!!!
sudo qemu-system-arm -M vexpress-a9 -kernel vmlinuz-3.2.0-4-vexpress \
-initrd initrd.img-3.2.0-4-vexpress -append "root=/dev/mmcblk0p2" \
-drive if=sd,cache=unsafe,file=hda.img \
-net nic,vlan=0 -net tap,vlan=0,ifname=tap0,script=no


