#!/bin/bash

#scp -P 2222 davis@localhost:/home/davis/progs/buffer_overflow.dump .


rsync -avz -e "ssh -l davis -p 2222" --exclude='.*.swp' davis@localhost:/home/davis/. ./archive/.
