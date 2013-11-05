Packer.io Demo
===========

Create a virtual machine image from scratch. Based on [https://github.com/smerrill/packer-templates]("https://github.com/smerrill/packer-templates")


How do i run it?
==============

Packer reads a template configuration file in json format and installs the OS from the ISO file, applies the OS configuration from a .cfg file and package everything in a vagrant box format.


1. Download Packer from Packer.io [Download](http://www.packer.io/downloads.html)
2. Modify the templates if you want to use full http urls or specific local paths for iso files 
3. Verify the **http** directory that contains the kickstart files for custom changes.
4. For RedHat distributions you need to uncompress the .iso files into the http directory or you might want to point to different location.
5. Run ```packer build <template_name>.json```

![packer ouput](http://github.com/lmayorga1980/packer-demo/raw/master/packer-image.png)

Tips
====

1. The kickstart files handle most of the basic installation configuration. Don't overkill
2. The <template>.json file user needs to match the default user created on the kickstart file

Current OS Support
=====

* Ubuntu
* CentOS
* Oracle Linux
