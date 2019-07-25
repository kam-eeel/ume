#!/bin/bash

dir="/home/ume/.arduino15" ## define driver directory

## check if default driver directory exists
if [ -d "$dir" ]
    then
        printf "Arduino device driver directory exists at /home/ume/.arduino15\n\n"
    else
        printf "Arduino device driver directory does not exist\n"
        printf "Creating at /home/ume/.arduino15\n\n"
        mkdir /home/ume/.arduino15/  > /dev/null 2>&1
        ## creates driver directory
fi 

mkdir -p /home/ume/tempclone/files > /dev/null 2>&1 ## create temporary directories for clone
mkdir -p /home/ume/tempclone/files2 > /dev/null 2>&1
mkdir -p /home/ume/tempclone/files3 > /dev/null 2>&1
printf "Downloading trinket drivers and libraries from GitHub\n\n"
sleep 3
git clone https://github.com/kam-eeel/ume  > /dev/null 2>&1 ## clone zip of files from github
printf "Installing files to /home/ume/.arduino15\n\n"
mv ./ume /home/ume/tempclone/
unzip /home/ume/tempclone/ume/trinket-drivers.zip -d /home/ume/tempclone/file > /dev/null 2>&1 ## unzip to temp dir
unzip /home/ume/tempclone/ume/DHT-sensor-library.zip -d /home/ume/tempclone/files2 > /dev/null 2>&1
unzip /home/ume/tempclonoe/ume/Adafruit-Unified-Sensor.zip -d /home/ume/files3 > /dev/null 2>&1
cp -n -r /home/ume/tempclone/file/* /home/ume/.arduino15 > /dev/null 2>&1 ## copy files to driver direcctory
cp -n -r /home/ume/tempclone/files2/* /home/ume/Arduino/libraries > /dev/null 2>&1
cp -n -r /home/ume/tempclone/files3/* /home/ume/Arduino/libraries > /dev/null 2>&1
chown -R ume /home/ume/.arduino15 > /dev/null 2>&1 ## change ownership to user ume
sleep 2
printf "Cleaning up...\n\n"
rm -rf /home/ume/tempclone > /dev/null 2>&1 ## remove clone files and temp directories
sleep 2
exit 0
