#!/bin/bash
nvm_installed=$(command -v nvm)
if [[ ! "$nvm_installed"=="nvm" ]]; then 
    echo "nvm doesn't exist. Install?"
else
    echo "nvm exists, skipping."
fi