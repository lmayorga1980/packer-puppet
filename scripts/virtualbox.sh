  echo "installing virtual box guest additions"
  mkdir -p /mnt/virtualbox
  mount -o loop /home/vagrant/VBoxGuest*.iso /mnt/virtualbox
  sh /mnt/virtualbox/VBoxLinuxAdditions.run
  umount /mnt/virtualbox
  rm -rf /home/vagrant/VBoxGuest*.iso