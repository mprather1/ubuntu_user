groups=($1 adm cdrom sudo plugdev dip lpadmin sambashare)

if [ ! -z ${1+x} ]; then
  sudo adduser $1

  for group in "${groups[@]}"; do
    sudo adduser $1 $group
  done
  printf "${1} ALL=(ALL) NOPASSWD:ALL" | sudo tee -a /etc/sudoers
else
  echo "Please include username as argument..."
fi
