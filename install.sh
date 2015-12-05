#!/bin/bash

# correct the path vars before running script ;-)

path_project=/var/www/html/app/WS2015_S4_Geo/
path_app=$path_project/app

echo "\n / install node.js and npm"
sudo apt-get update
sudo apt-get install git nodejs npm nodejs-legacy

cd $path_project

if ! [ -f "package.json" ]
then
    echo "\n\n error: did'nt found package.json 
    please change the var (at the top of install.sh): 
    path_project to the dir where the file package.json 
    exist\n"
    
    exit 1
fi 

echo "\n / found package.json - install dependencies"
sudo npm install

echo "\n / install bower (global)"

sudo npm install -g bower

echo "\n / install additional dependencies for the app"
sudo bower install angular --allow-root
sudo bower install openlayers3 --allow-root
sudo bower install bootstrap --allow-root
sudo bower install angular-animate --allow-root
