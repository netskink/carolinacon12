#!/bin/bash

# make a disk image
#qemu-img create -f qcow hda.img 10G
#exit


#install
#qemu-system-i386 -boot d -cdrom archlinux-2015.12.01-dual.iso -m 512 -hda hda.img
#exit

# fsck this. Lets try this
# From the host, do :
# $ ssh davis@localhost -p 2222
# to get a shell on the guest.
qemu-system-i386 hda.img -m 512 -redir tcp:2222::22
exit

########
#
# all of the stuff below was failed attempts at networking host to guest.
#
########


#run - this allows the guest to use host network to reach internet
# So, with this you can install archlinux from network
#qemu-system-i386 -boot d -m 512 -hda mydisk.img

#
# run with host to guest networking
# (add bridgeutils and dnsmasq packages)
#

# take down any existing bridge networks
# (This is so I can reconfigure below)
#ip link set br0 down
#brctl delbr br0
#exit


# This adds a bridge for host only networking. ie. the host can reach the guest via network
#brctl addbr br0
#ip addr add 172.20.0.1/16 dev br0
#ip link set br0 up
#dnsmasq --interface=br0 --bind-interfaces --dhcp-range=172.20.0.2,172.20.255.254

#qemu-system-i386 -boot d -m 512 -hda mydisk.img -net nic,model=virtio -net tap,ifname=tap0,script=no,downscript=no
#qemu-system-i386 mydisk.img -m 512 -netdev bridge,id=hn0 -device virtio-net-pci,netdev=hn0,id=nic1
#qemu-system-i386 mydisk.img -m 512 -net nic -net bridge,br=br0



