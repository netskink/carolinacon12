#!/bin/bash

# this is the follow along to 
# https://fedoraproject.org/wiki/Architectures/ARM/HowToQemu

# Create the rootfs 
#dd if=/dev/zero of=rootfs-f12-dev bs=1024k count=4096
#mkfs.ext3 rootfs-f12-dev -L rootfs
#exit

#mkdir ARM_FS
#mount rootfs-f12-dev ARM_FS -o loop
#tar -xjf rootfs-f12.tar.bz2 -C ARM_FS
#mv ARM_FS/rootfs-f12/* ARM_FS
#rm -rf ARM_FS/rootfs-f12
# copy your kernel modules from $TARGETDIR from the kernel build
# ie. cp /lib/modules/kernel_number ie /lib/modules/2.6.33.8
#umount rootfs-f12-dev
#exit


# This will boot a system.  
# It already has a setup which has a root password of fedoraarm
 qemu-system-arm -M versatilepb \
 -kernel zImage-qemu-versatile-3.0.8-4.fc17.armv5tel \
 -hdc rootfs-f12-dev -append root="0800" 
exit

# This will boot a system which has host only networking
qemu-system-arm -M versatilepb \
 -kernel zImage-qemu-versatile-3.0.8-4.fc17.armv5tel \
 -hdc rootfs-f12-dev -append root="0800" \
-net nic,vlan=0 -net tap,vlan=0,ifname=tap0,script=no
