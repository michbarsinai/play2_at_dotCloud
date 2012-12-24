#!/bin/bash

set -e
BUILDROOT="$(dirname "$0")"
APPLICATION_DIR=play2app

echo 'Pre-install cleanup...'
if [ -d ~/$APPLICATION_DIR ]
then
    rm -rf ~/$APPLICATION_DIR
fi

echo 'Copying the run script'
cp -f run ~/run

echo 'Creating application directory'
mkdir ~/$APPLICATION_DIR

echo 'Installing application'
unzip -d ~/$APPLICATION_DIR appfolder/play2-app.zip > /dev/null
cd
UNZIPPED_DIR=$(ls $APPLICATION_DIR)
mv $APPLICATION_DIR/$UNZIPPED_DIR/* $APPLICATION_DIR
rmdir $APPLICATION_DIR/$UNZIPPED_DIR
chmod +x $APPLICATION_DIR/start

# See the whole java7 thing
if [[ ! -d java7 ]]; then
    echo "installing java 7 from Oracle's website"
    mkdir java7
    cd java7
    echo "Downloading java7"
    wget -O java7u10.tar.gz http://javadl.sun.com/webapps/download/AutoDL?BundleId=71828
    echo "Unzipping and untaring java7"
    tar zxvf java7u10.tar.gz
    rm java7u10.tar.gz
    ln -s jre1.7.0_10/bin/java java
    echo "... Install done"
fi

echo 'Builder Done'
