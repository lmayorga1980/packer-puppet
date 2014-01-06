### Packer/Vagrant/Puppet PE Demo

Create a virtual machine box vagrant ready.(CentOS, Ubuntu, OracleLinux, Windows). Base on ...

* [https://github.com/smerrill/packer-templates]("https://github.com/smerrill/packer-templates")
* [https://github.com/joefitzgerald/packer-windows]("https://github.com/joefitzgerald/packer-windows")

### Requirements

* [Packer 0.5 or later](http://www.packer.io/downloads.html)
* [Vagrant 1.4.2 or later](http://downloads.vagrantup.com/)
* [VirtualBox 4.3.6 or later](https://www.virtualbox.org/wiki/Downloads) or [VMWare Fusion](http://www.vmware.com/products/fusion-professional/)
* Specific ISO files for each OS.

### How does it work?

Packer reads a template configuration file in json format and installs the OS from the ISO file, applies the OS configuration from a .cfg file and package everything in a vagrant box format.

* Modify the templates if you want to use full http urls or specific local paths for iso files. 
* Verify the **http** directory that contains the kickstart files for custom changes.
* For RedHat distributions you need to uncompress the .iso files into the http directory or you might want to point to different location.
* Run `packer build <template_name>.json` 

![packer ouput](http://github.com/lmayorga1980/packer-demo/raw/master/packer-image.png)

### Oracle Linux Example

* Create Oracle Linux Image `packer build -only=virtualbox-iso oracle.json`
* Download JRockit to **files** folder (**jrockit-jdk1.6.0_45-R28.2.7-4.1.0-64.bin**) 
* Add Vagrant Box `vagrant box add oracle6_64 oracle6_64_virtualbox.box`
* Run Vagrant Box `vagrant up` (Run from **vagrant/oracle**) 
* Wait for Puppet Enterprise Installation...
* SSH to Virtual Machine (`vagrant ssh`)
* Execute `sudo /usr/local/bin/puppet agent -t`
* Restart the virtual machine `sudo reboot`

### Windows 2008 R2 Example

* Download Windows 2008 R2 ISO Image from MSDN and change your .json file accordinly. 
* Create Windows 2008 R2 Image `packer build -only=virtualbox-iso win2008r2core.json`
* Add Vagrant Box `vagrant box add win2008r2core win2008_r2_core_virtualbox.box`
* Run Vagrant Box `vagrant up` (Run from **vagrant/windows**) 
* SSH to Virtual Machine (`vagrant ssh`)

### Tips

1. The kickstart files handle most of the basic installation configuration. Don't overkill
2. The <template>.json file user needs to match the default user created on the kickstart file
3. The Windows Packer Template takes a while to create since it install the Windows Updates. Check `cfg_windows\Autounattend.xml` to remove the Windows Updates if necessary. 
