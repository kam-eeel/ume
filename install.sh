#!/bin/bash

dir="/home/ume/.arduino15" ## define driver directory

## check if default driver directory exists
if [ -d "$dir" ]
    then
        printf "Arduino device driver directory exists at /home/ume/.arduino15\n\n"
        rm -rf /home/ume/.arduino15/* > /dev/null 2>&1
        ## clears directory for new drivers
            ## consider changing script here as is currently one time use
    else
        printf "Arduino device driver directory does not exist\n"
        printf "Creating at /home/ume/.arduino15\n\n"
        mkdir /home/ume/.arduino15/ > /dev/null 2>&1
        ## creates driver directory
fi 

mkdir /home/ume/tempclone /home/ume/tempclone/files > /dev/null 2>&1 ## create temporary directories for clone
printf "Downloading trinket drivers from GitHub\n\n"
git clone https://github.com/kam-eeel/ume.git /home/ume/tempclone > /dev/null 2>&1 ## clone zip of files from github
printf "Installing files to /home/ume/.arduino15\n\n"
unzip /home/ume/tempclone/ume/trinket-drivers.zip -d /home/ume/tempclone/files > /dev/null 2>&1 ## unzip to temp dir
cp -n -r /home/ume/tempclone/files/* /home/ume/.arduino15 > /dev/null 2>&1 ## copy files to driver direcctory
chown -R ume /home/ume/.arduino15 > /dev/null 2>&1 ## change ownership to user ume
printf "Cleaning up...\n\n"
rm -rf /home/ume/tempclone > /dev/null 2>&1 ## remove clone files and temp directories
exit 0