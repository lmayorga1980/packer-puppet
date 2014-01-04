### Packer/Vagrant/Puppet PE Demo

Create a virtual machine box vagrant ready.(CentOS, Ubuntu, OracleLinux, Windows). Base on ...

* [https://github.com/smerrill/packer-templates]("https://github.com/smerrill/packer-templates")
* [https://github.com/joefitzgerald/packer-windows]("https://github.com/joefitzgerald/packer-windows")

### Requirements

1. [Packer 0.5 or later](http://www.packer.io/downloads.html)
2. [Vagrant 1.4.2 or later](http://downloads.vagrantup.com/)
3. [VirtualBox 4.3.6 or later](https://www.virtualbox.org/wiki/Downloads) or [VMWare Fusion](http://www.vmware.com/products/fusion-professional/)
3. Download Operating System .iso files for Packer.

### How does it work?

Packer reads a template configuration file in json format and installs the OS from the ISO file, applies the OS configuration from a .cfg file and package everything in a vagrant box format.

1. Modify the templates if you want to use full http urls or specific local paths for iso files 
2. Verify the **http** directory that contains the kickstart files for custom changes.
3. For RedHat distributions you need to uncompress the .iso files into the http directory or you might want to point to different location.
4. Run `packer build <template_name>.json`

![packer ouput](http://github.com/lmayorga1980/packer-demo/raw/master/packer-image.png)

### Oracle Linux Example

1. Create Oracle Linux Image `packer build -only=virtualbox-iso oracle.json`
2. Download JRockit to **files** folder (**jrockit-jdk1.6.0_45-R28.2.7-4.1.0-64.bin**) 
2. Add Vagrant Box `vagrant box add packer packer_virtualbox_virtualbox.box`
3. Run Vagrant Box `vagrant up` (Run from **vagrat/oracle**) 
4. Wait for Puppet Enterprise Installation...
5. SSH to Virtual Machine (`vagrant ssh`)
6. Execute `sudo /usr/local/bin/puppet agent -t`
7. Restart the virtual machine `sudo reboot`

### Tips

1. The kickstart files handle most of the basic installation configuration. Don't overkill
2. The <template>.json file user needs to match the default user created on the kickstart file
3. The Windows Packer Template takes a while to create since it install the Windows Updates. Check `cfg_windows\Autounattend.xml` to remove the Windows Updates if necessary. 
