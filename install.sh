#!/bin/bash

dir="/home/ume/.arduino15" ## define driver directory

## check if default driver directory exists
if [ -d "$dir" ]
    then
        printf "Arduino device driver directory exists at /home/ume/.arduino15\n\n"
    else
        printf "Arduino device driver directory does not exist\n" ## this directory is not always installed by default, however is always used by arduino app
        printf "Creating at /home/ume/.arduino15\n\n"
        mkdir /home/ume/.arduino15/  > /dev/null 2>&1
        ## creates driver directory
fi 

## create temporary directories for clone
mkdir -p /home/ume/tempclone/files > /dev/null 2>&1 
mkdir -p /home/ume/tempclone/files2 > /dev/null 2>&1
mkdir -p /home/ume/tempclone/files3 > /dev/null 2>&1
mkdir -p /home/ume/tempclone/files4 > /dev/null 2>&1
printf "Downloading trinket drivers and other libraries from GitHub\n\n"
sleep 3

## clone zip of files from github
git clone https://github.com/kam-eeel/ume  > /dev/null 2>&1 
printf "Installing files to /home/ume/.arduino15 and /home/ume/Arduino/libraries\n\n"
mv ./ume /home/ume/tempclone/

## unzip to temp dir
unzip /home/ume/tempclone/ume/trinket-drivers.zip -d /home/ume/tempclone/file > /dev/null 2>&1 
unzip /home/ume/tempclone/ume/DHT-sensor-library.zip -d /home/ume/tempclone/files2 > /dev/null 2>&1
unzip /home/ume/tempclone/ume/Adafruit-Unified-Sensor.zip -d /home/ume/tempclone/files3 > /dev/null 2>&1
unzip /home/ume/tempclone/ume/SevSeg.zip -d /home/ume/tempclone/files4 > /dev/null 2>&1

## copy files to driver directory
cp -n -r /home/ume/tempclone/file/* /home/ume/.arduino15 > /dev/null 2>&1
cp -n -r /home/ume/tempclone/files2/* /home/ume/Arduino/libraries > /dev/null 2>&1
cp -n -r /home/ume/tempclone/files3/* /home/ume/Arduino/libraries > /dev/null 2>&1
cp -n -r /home/ume/tempclone/files4/* /home/ume/Arduino/libraries > /dev/null 2>&1

## change ownership to user ume
chown -R ume /home/ume/.arduino15 > /dev/null 2>&1 
sleep 2

## remove clone files and temp directories
printf "Cleaning up...\n\n"
rm -rf /home/ume/tempclone > /dev/null 2>&1 
sleep 2

exit 0
