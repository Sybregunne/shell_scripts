#!/bin/bash

# how to properly include a library script...

#DIR="${BASH_SOURCE%/*}"
#if [[ ! -d "$DIR" ]]; then DIR="$PWD"; fi
#
#. "$DIR/lib/incl.sh"

generateconf()
{
    
    p_name=$1
    p_servername=$2
    spwd=$(pwd)
    cd ~
    hpwd=$(pwd)
    if [[ ! -d "$hpwd/project" ]]; then 
        echo "$(pwd) is the current working directory"
        mkdir "$hpwd/project"
        echo "$hpwd/project directory was created!"
    else
        echo "$hpwd/project already exists. Skipping creation!"
    fi

    cd "$hpwd/project"
    if [[ ! -d "$hpwd/project/$p_name" ]]; then 
        echo "$(pwd) is the current working directory"
        mkdir "$hpwd/project/$p_name"; 
        echo "$hpwd/project/$p_name was created!"
    else
        echo "$hpwd/project/$p_name already exists. Skipping creation!" 
    fi
    p_file="$hpwd/project/$p_name/$p_name.conf"
    echo "$(pwd) is the current directory. We will then store the conf in $p_file"
    #echo "<nginx conf>" > $p_file
    # echo "$p_name ==> $p_file"
    touch $p_file && ls $p_file
    echo "server {" > $p_file
    echo "  listen 80;" >> $p_file
    echo "  server_name $p_servername;" >> $p_file
    echo "  root /var/www/html/$p_name/public;" >> $p_file 
    echo "  add_header X-Frame-Options \"SAMEORIGIN\";" >> $p_file
    echo "  add_header X-XSS-Protection \"1; mode=block\";" >> $p_file
    echo "  add_header X-Content-Type-Options \"nosniff\";" >> $p_file
    echo "  " >> $p_file
    echo "  index index.html index.htm index.php;" >> $p_file
    echo "  " >> $p_file
    echo "  charset utf-8;" >> $p_file
    echo "  " >> $p_file
    echo "  location / {" >> $p_file
    echo "    try_files \$uri \$uri/ /index.php?\$query_string;" >> $p_file
    echo "  }" >> $p_file
    echo "  " >> $p_file
    echo "  location = /favicon.ico { access_log off; log_not_found off; }" >> $p_file
    echo "  location = /robots.txt  { access_log off; log_not_found off; }" >> $p_file
    echo "  " >> $p_file
    echo "  error_page 404 /index.php;" >> $p_file
    echo "  " >> $p_file
    echo "  location ~ \.php$ {" >> $p_file
    echo "    fastcgi_pass unix:/var/run/php/php8.3-fpm.sock;" >> $p_file
    echo "    fastcgi_index index.php;" >> $p_file
    echo "    fastcgi_param SCRIPT_FILENAME $realpath_root$fastcgi_script_name;" >> $p_file
    echo "    include fastcgi_params;" >> $p_file
    echo "  }" >> $p_file
    echo "  " >> $p_file
    echo "  location ~ /\.(?!well-known).* {" >> $p_file
    echo "      deny all;" >> $p_file
    echo "  }" >> $p_file
    echo "}" >> $p_file
}

generateconf $1 $2

clear
echo "$p_file contents:"
cat "$p_file"