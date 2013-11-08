# Bail if we are not running inside VirtualBox.
if [ -f /home/vagrant/VBoxGuestAdditions_4.3.2.iso ];
then
  echo "installing virtual box guest additions"
  mkdir -p /mnt/virtualbox
  mount -o loop /home/vagrant/VBoxGuest*.iso /mnt/virtualbox
  sh /mnt/virtualbox/VBoxLinuxAdditions.run
  umount /mnt/virtualbox
  rm -rf /home/vagrant/VBoxGuest*.iso
else
  echo "this is not a oracle virtual box vm"
  exit 0  
fi
