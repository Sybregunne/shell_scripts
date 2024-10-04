#!/bin/bash

curdir=$(pwd)

checkinst() {
    scriptname=$1
    instloc=$(which "$scriptname")
    if [[ "$instloc" == "" ]]; then
        echo -n "Installing $scriptname."
        ln -s "$curdir/scripts/$scriptname" ~/bin/$scriptname
        chmod +x ~/bin/"$scriptname"
        echo " Done!"
    else
        echo "The script/binary \"$scriptname\" is already installed in $(which $scriptname)"
    fi
}
linklib() {
    libdir="$(pwd)/lib"
    if [[ ! -d ~/bin/lib ]]; then 
        ln -s "$libdir" ~/bin/lib
        echo "lib folder linked successfully!"
    else
        echo "lib folder already linked"
    fi
}
linklib
checkinst server
checkinst update
checkinst setup.laravel
checkinst which-pkg