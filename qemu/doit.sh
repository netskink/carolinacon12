#!/bin/bash

#./configure --python=python2 --help
echo ./configure --python=python2 --disable-docs --target-list=arm-softmmu,i386-softmmu

exit

Usage: configure [options]
Options: [defaults in brackets after descriptions]

Standard options:
  --help                   print this message
  --prefix=PREFIX          install in PREFIX [/usr/local]
  --interp-prefix=PREFIX   where to find shared libraries, etc.
                           use %M for cpu name [/usr/gnemul/qemu-%M]
  --target-list=LIST       set target list (default: build everything)
                           Available targets: aarch64-softmmu alpha-softmmu 
                           arm-softmmu cris-softmmu i386-softmmu lm32-softmmu 
                           m68k-softmmu microblazeel-softmmu microblaze-softmmu 
                           mips64el-softmmu mips64-softmmu mipsel-softmmu 
                           mips-softmmu moxie-softmmu or32-softmmu 
                           ppc64-softmmu ppcemb-softmmu ppc-softmmu 
                           s390x-softmmu sh4eb-softmmu sh4-softmmu 
                           sparc64-softmmu sparc-softmmu tricore-softmmu 
                           unicore32-softmmu x86_64-softmmu xtensaeb-softmmu 
                           xtensa-softmmu aarch64-linux-user alpha-linux-user 
                           armeb-linux-user arm-linux-user cris-linux-user 
                           i386-linux-user m68k-linux-user 
                           microblazeel-linux-user microblaze-linux-user 
                           mips64el-linux-user mips64-linux-user 
                           mipsel-linux-user mips-linux-user 
                           mipsn32el-linux-user mipsn32-linux-user 
                           or32-linux-user ppc64abi32-linux-user 
                           ppc64le-linux-user ppc64-linux-user ppc-linux-user 
                           s390x-linux-user sh4eb-linux-user sh4-linux-user 
                           sparc32plus-linux-user sparc64-linux-user 
                           sparc-linux-user tilegx-linux-user 
                           unicore32-linux-user x86_64-linux-user

Advanced options (experts only):
  --source-path=PATH       path of source code [/home/davis/progs/carolinacon12/qemu/qemu]
  --cross-prefix=PREFIX    use PREFIX for compile tools []
  --cc=CC                  use C compiler CC [cc]
  --iasl=IASL              use ACPI compiler IASL [iasl]
  --host-cc=CC             use C compiler CC [cc] for code run at
                           build time
  --cxx=CXX                use C++ compiler CXX [c++]
  --objcc=OBJCC            use Objective-C compiler OBJCC [cc]
  --extra-cflags=CFLAGS    append extra C compiler flags QEMU_CFLAGS
  --extra-ldflags=LDFLAGS  append extra linker flags LDFLAGS
  --make=MAKE              use specified make [make]
  --install=INSTALL        use specified install [install]
  --python=PYTHON          use specified python [python2 -B]
  --smbd=SMBD              use specified smbd [/usr/sbin/smbd]
  --static                 enable static build [no]
  --mandir=PATH            install man pages in PATH
  --datadir=PATH           install firmware in PATH/qemu
  --docdir=PATH            install documentation in PATH/qemu
  --bindir=PATH            install binaries in PATH
  --libdir=PATH            install libraries in PATH
  --sysconfdir=PATH        install config in PATH/qemu
  --localstatedir=PATH     install local state in PATH (set at runtime on win32)
  --with-confsuffix=SUFFIX suffix for QEMU data inside datadir/libdir/sysconfdir [/qemu]
  --enable-debug           enable common debug build options
  --disable-strip          disable stripping binaries
  --disable-werror         disable compilation abort on warning
  --disable-stack-protector disable compiler-provided stack protection
  --audio-drv-list=LIST    set audio drivers list:
                           Available drivers: oss alsa sdl pa
  --block-drv-whitelist=L  Same as --block-drv-rw-whitelist=L
  --block-drv-rw-whitelist=L
                           set block driver read-write whitelist
                           (affects only QEMU, not qemu-img)
  --block-drv-ro-whitelist=L
                           set block driver read-only whitelist
                           (affects only QEMU, not qemu-img)
  --enable-trace-backends=B Set trace backend
                           Available backends: nop, dtrace, ftrace, simple, stderr, ust
  --with-trace-file=NAME   Full PATH,NAME of file to store traces
                           Default:trace-<pid>
  --disable-slirp          disable SLIRP userspace network connectivity
  --enable-tcg-interpreter enable TCG with bytecode interpreter (TCI)
  --oss-lib                path to OSS library
  --cpu=CPU                Build for host CPU [x86_64]
  --with-coroutine=BACKEND coroutine backend. Supported options:
                           gthread, ucontext, sigaltstack, windows
  --enable-gcov            enable test coverage analysis with gcov
  --gcov=GCOV              use specified gcov [gcov]
  --disable-blobs          disable installing provided firmware blobs
  --with-vss-sdk=SDK-path  enable Windows VSS support in QEMU Guest Agent
  --with-win-sdk=SDK-path  path to Windows Platform SDK (to build VSS .tlb)

Optional features, enabled with --enable-FEATURE and
disabled with --disable-FEATURE, default is enabled if available:

  system          all system emulation targets
  user            supported user emulation targets
  linux-user      all linux usermode emulation targets
  bsd-user        all BSD usermode emulation targets
  docs            build documentation
  guest-agent     build the QEMU Guest Agent
  guest-agent-msi build guest agent Windows MSI installation package
  pie             Position Independent Executables
  modules         modules support
  debug-tcg       TCG debugging (default is disabled)
  debug-info      debugging information
  sparse          sparse checker

  gnutls          GNUTLS cryptography support
  nettle          nettle cryptography support
  gcrypt          libgcrypt cryptography support
  sdl             SDL UI
  --with-sdlabi     select preferred SDL ABI 1.2 or 2.0
  gtk             gtk UI
  --with-gtkabi     select preferred GTK ABI 2.0 or 3.0
  vte             vte support for the gtk UI
  curses          curses UI
  vnc             VNC UI support
  vnc-sasl        SASL encryption for VNC server
  vnc-jpeg        JPEG lossy compression for VNC server
  vnc-png         PNG compression for VNC server
  cocoa           Cocoa UI (Mac OS X only)
  virtfs          VirtFS
  xen             xen backend driver support
  xen-pci-passthrough
  brlapi          BrlAPI (Braile)
  curl            curl connectivity
  fdt             fdt device tree
  bluez           bluez stack connectivity
  kvm             KVM acceleration support
  rdma            RDMA-based migration support
  uuid            uuid support
  vde             support for vde network
  netmap          support for netmap network
  linux-aio       Linux AIO support
  cap-ng          libcap-ng support
  attr            attr and xattr support
  vhost-net       vhost-net acceleration support
  spice           spice
  rbd             rados block device (rbd)
  libiscsi        iscsi support
  libnfs          nfs support
  smartcard       smartcard support (libcacard)
  libusb          libusb (for usb passthrough)
  usb-redir       usb network redirection support
  lzo             support of lzo compression library
  snappy          support of snappy compression library
  bzip2           support of bzip2 compression library
                  (for reading bzip2-compressed dmg images)
  seccomp         seccomp support
  coroutine-pool  coroutine freelist (better performance)
  glusterfs       GlusterFS backend
  archipelago     Archipelago backend
  tpm             TPM support
  libssh2         ssh block device support
  vhdx            support for the Microsoft VHDX image format
  numa            libnuma support
  tcmalloc        tcmalloc support
  jemalloc        jemalloc support

NOTE: The object files are built at the place where configure is launched


