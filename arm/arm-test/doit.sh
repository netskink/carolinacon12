#!/bin/bash

# This is the script to run the qemu arm test image.

# The wiki page where I pulled this image does not give 
# run instructions which specify the machine type.  These
# are the ones I've run and their results.

# From the readme
# ./qemu-system-arm -kernel zImage.integrator -initrd arm_root.img
# 
# Or without graphical output:
# 
# ./qemu-system-arm -kernel zImage.integrator -initrd arm_root.img 
# -nographic -append "console=ttyAMA0"


# says possible bug
#qemu-system-arm -M vexpress-a9 -kernel zImage.integrator -initrd arm_root.img

# starts but output
#qemu-system-arm -M versatilepb -kernel zImage.integrator -initrd arm_root.img

# This works.  Its a minimal busybox rootfs
qemu-system-arm -M integratorcp -kernel zImage.integrator -initrd arm_root.img




