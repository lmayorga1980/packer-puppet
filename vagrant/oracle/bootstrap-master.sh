#!/bin/bash 
#####
PUPPET_PACKAGE="puppet-enterprise-3.1.0-el-6-x86_64.tar.gz"
PUPPET_INSTALL_DIR="puppet-enterprise-3.1.0-el-6-x86_64"
#####

##### Disable Firewall
/sbin/service iptables stop
#####

### Check for previous installation
/usr/local/bin/puppet --version

if [ $? -eq 0 ]; then
    echo "You already have Puppet Enteprise installed. Sorry!"
    exit 0
fi
###

### Download Puppet Enteprise Package
if [ -f /vagrant_data/puppet-enterprise-3.1.0-el-6-x86_64.tar.gz ]; then
  echo "Puppet Enteprise exists on /vagrant_data"
  cp /vagrant_data/puppet-enterprise-3.1.0-el-6-x86_64.tar.gz /home/vagrant
else
  echo 'Downloading Puppet Enterprise ....'
  wget --quiet https://s3.amazonaws.com/pe-builds/released/3.1.0/$PUPPET_PACKAGE
fi
###

### Install Puppet Enteprise Master and Agent
 tar xvf $PUPPET_PACKAGE
 cp /vagrant_data/answers.puppetenterprise ./$PUPPET_INSTALL_DIR/answers.puppetenterprise
 ./$PUPPET_INSTALL_DIR/puppet-enterprise-installer -a ./$PUPPET_INSTALL_DIR/answers.puppetenterprise
###

echo '### Set Hiera Configuration'
cp /vagrant_data/hiera.yaml /etc/puppetlabs/puppet -f
mkdir /hiera
cp -R /vagrant_data/hiera/* /hiera
cp /vagrant_data/autosign.conf /etc/puppetlabs/puppet

cp -R /puppet_manifests/* /etc/puppetlabs/puppet/manifests
cp -R /puppet_modules/* /etc/puppetlabs/puppet/modules


echo '###'
echo 'Use the following credentials for the puppet console...'
echo 'user: admin@demo.com'
echo 'pwd: admin123'
echo '###'


