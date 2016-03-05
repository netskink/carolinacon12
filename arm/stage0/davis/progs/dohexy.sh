#!/bin/bash

# for hello
# hexdump -s 0x34 -n 48 -v -e'/1 "Yx%02x"' hello.o > hellobytes.txt
# sed -i 's/Y/\\/g' hellobytes.txt

# for salwan 
#hexdump -s 0x34 -n 36 -v -e'/1 "Yx%02x"' salwan.o > salwanbytes.txt
hexdump -s 0x34 -n 40 -v -e'/1 "Yx%02x"' salwan.o > salwanbytes.txt
sed -i 's/Y/\\/g' salwanbytes.txt

# for shell
#hexdump -s 0x34 -n 50 -v -e'/1 "Yx%02x"' shell.o > shellbytes.txt
#sed -i 's/Y/\\/g' shellbytes.txt

