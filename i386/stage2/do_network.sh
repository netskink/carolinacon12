#!/bin/bash

# Do this to setup host only networking
brctl addbr br0
ip addr add 172.16.0.1/24 broadcast 172.16.0.255 dev br0
ip link set br0 up
ip tuntap add dev tap0 mode tap
ip link set tap0 up promisc on
brctl addif br0 tap0
dnsmasq --interface=br0 --bind-interfaces --dhcp-range=172.16.0.10,172.16.0.20


