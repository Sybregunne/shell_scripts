#!/bin/sh

update()
{
  sudo apt update
}

upgrade()
{
  sudo apt upgrade -y
}

autoclean()
{
  sudo apt autoclean -y
}

autoremove()
{
  sudo apt autoremove -y
}

dist_upgrade()
{
  sudo apt dist-upgrade -y
}

do_release_upgrade()
{
  sudo do-release-upgrade
}

update_all()
{
  update 
  upgrade
  dist_upgrade 
  autoclean
  autoremove
  do_release_upgrade
}