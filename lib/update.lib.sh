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
  echo "sudo apt update"
  update 
  echo "sudo apt upgrade"
  upgrade
  echo "sudo apt dist-upgrade"
  dist_upgrade 
  echo "sudo apt autoclean"
  autoclean 
  echo "sudo apt autoremove"
  autoremove 
  sudo do-release-upgrade
  do_release_upgrade
  echo "Update and clean-up done successfully!"
  echo ""
}