#!/bin/bash

# This will use rsync to copy files from the local davis directory
# the vm /home/davis/ directory

# This must use the -e option since the ssh usage of rscnc does not allow for
# the user to specify a port
rsync -avz -e "ssh -l davis -p 2222" --exclude='.*.swp' davis/. davis@localhost:/home/davis/.
