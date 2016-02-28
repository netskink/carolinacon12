#!/bin/bash

hexdump -s 0x180 -n 0x39 -v -e'/1 "Yx%02x"' shell.o > shellbytes.txt
sed -i 's/Y/\\/g' shellbytes.txt

