# shell_scripts
A collection of very basic shell scripts I use.

### Ubuntu
* [update](scripts/update) - update, upgrade, autoclean and do-release-upgrade
* [server](scripts/server) - Currently run systemctl (nginx & mysql) <up|down|status>
* [setup.laravel](scripts/setup.laravel) - (Still buggy) Prepares your WSL for Laravel Development
* [which-pkg](scripts/which-pkg) - Literally a dpkg -S wrapper

## Installation
There is an install script included. A very basic one. It creates a symbolic link from '$USER/projects/shell_scripts/scripts' to '$USER/bin'. The installer will check if the script is existing before attempting to create the symbolic links. 

```bash
mkdir ~/projects
git clone git@github.com:Sybregunne/shell_scripts.git
cd ~/shell_scripts
./install.sh
. ~/.bashrc
```
Another way is to clone the repository and just copy the scripts that you need.