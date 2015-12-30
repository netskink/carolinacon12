# carolinacon12
My work for carolinacon12

The first thing to do was to setup qemu support for the desired virtual machines
with host only networking.  Qemu support for archlinux does not have a prebuilt 
qemu with arm support.  Qemu from git source was used to build qemu
for i386 and arm was built.  The install of archlinux for i386 was trivial
and used as a test of my i386 build.  Afterwards arm support was tested
using the test image on the qemu image page.  Once this worked I used
Marty Vanhoef's webpage to get a debian arm vm installed.  However the method
he detailed for working with virtual networking did not.  I found a page
on the archlinux forums that showed how to get virual host only networking
which did work for i386 but did not work with Marty's kernel and rootfs.
Much later I found a fedora method that did.  Since I prefer debian over
fedora I modified Marty's method to use this approach and viola it worked.
Note, much earlier in the process I tried to use arch linux for ARM but along
the way found a forum member (moderator) mention that arch arm linux would never
support QEMU so I abandoned using their work.  Lastly, since I did not know 
jack about taps and bridges it was helpful to find a post in the archlinux 
forums about setting up a bridge/tap manually.  This was the key to 
getting the i386 vm working.

Here are the urls used for this setup.  

http://www.mathyvanhoef.com/2013/12/reversing-and-exploiting-arm-binaries.html  

https://fedoraproject.org/wiki/Architectures/ARM/HowToQemu  

https://bbs.archlinux.org/viewtopic.php?id=182320
