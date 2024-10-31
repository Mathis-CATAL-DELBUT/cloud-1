# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
# Vagrant.configure("2") do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://vagrantcloud.com/search.
  Vagrant.configure("2") do |config|
    # Définir l'image de base
    config.vm.box = "ubuntu/focal64"
  
    # Configurer le réseau si nécessaire
    config.vm.network "private_network", type: "dhcp"
  
    # Synchroniser le dossier Ansible vers la VM
    config.vm.synced_folder "./ansible-deploy-inception", "/home/vagrant/ansible-deploy-inception"
  
    # Provisionner la machine avec Ansible
    config.vm.provision "shell", inline: <<-SHELL
      sudo apt update
      sudo apt install -y ansible git make gcc  # Installer Ansible et les outils nécessaires
      ansible-playbook -i /home/vagrant/ansible-deploy-inception/inventory.ini /home/vagrant/ansible-deploy-inception/deploy.yml
    SHELL

    # add ssh key
    config.vm.provision "shell", inline: <<-SHELL
      mkdir -p /home/vagrant/.ssh
      echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDFb3369x9G2XpSIrTd+lT49rqtCufQlc3tiiA3pKI5a6hvp4abgvClFCWgfP05E6474CDpL32Og9zSyutVWTeP8eaW5VCOSIi1E8TAnnRj7us+vTVg0O3Ua1uIYxvJdLNTN4zL0jw4tAm2iDJETgB1R2gEAymzQK3XtZv0SE2I3P6qlvQYw/socbdnnujPs6exMaVkJdjMUXTkjYm5Vn+ok4o1KKQJnqhpWv76qnbM/OBoQWqEKM5GBZPxl7uCleAMWKTozcCiES5ztibT+5tyf1saxD8QyPhrLF2tStP9NnUeq7dQ4eRV8+9A3LnawfNgbn7frD8L518eGQZEwo4HlXfXW0ZpXflYcHV1xn4JHGxUyMpbkuy0Gw+HA++IpfjsooPcWhDOJg3eCCvPEInj8HprHhxbdeVBo4l/hrlQIWwGgLnCkZl/saCyo1VCcnVJE3rzqvZbue3rFei1SDKh0KRQheJRmX7VYa1cUy49wsWP8vXJhCOwDx9lYbX3jAE= mathis@mathis-VirtualBox" >> /home/vagrant/.ssh/authorized_keys
      echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDAiP8+3Ob+mGUGNw2zpyQqzTVdU7QOZtv8fnz82Nq2JKJ+AG5CE2Hd8uQsnaFufJhTALyoCVHigTOsocaSf342c0SI7nYdSX7ivkOgSiuznper/aQyGx3avMJAKWuPQB6WdHP4usN6uhYeMuW0YmpiszrwwrIG25h0je9HYSdf3OVTVrF8mqrNGR+wCsNuR7XT3zZ2em5zm/pbavcfrOtmisp0pGLB4rngln7aQ5SBwoMiyD6ywHOZp03UmnogR/pj3pFOtl+xrKXtNe7rdWVr1IBbMj4h5ZesR9eGQGkdcVlOMVsJbCT4hdtt9TkU7UefzB48HsO45kWe9bTIoRrh9NsRo8pkcdcrvYFfIK5HFO4BiyBNm/XdVSFs/6IFcB1S580BvdF6/8LEVvzQJCQQow0FVcs2m9o8lcOu6JyhuLQer6pQRt0eTfUAh3I7nM1noYd+FBxwLh3GisxywW/15+OoRt1C/2SI7O/fWjcioXJWgMX7Uz1VrrnP8V9p8a8= mcatal-d@e3r7p11.42.fr" >> /home/vagrant/.ssh/authorized_keys
      chmod 600 /home/vagrant/.ssh/authorized_keys
      chown -R vagrant:vagrant /home/vagrant/.ssh
    SHELL
  end
  

  # Vagrant.configure("2") do |config|
  #   config.vm.box = "ubuntu/focal64"
    
  #   # Configuration réseau et ressources
  #   config.vm.network "private_network", type: "dhcp"
  #   config.vm.provider "virtualbox" do |vb|
  #     vb.memory = "2048"
  #     vb.cpus = 2
  #   end
  
  #   # Ajouter la clé publique SSH
    # config.vm.provision "shell", inline: <<-SHELL
    #   mkdir -p /home/vagrant/.ssh
    #   echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDFb3369x9G2XpSIrTd+lT49rqtCufQlc3tiiA3pKI5a6hvp4abgvClFCWgfP05E6474CDpL32Og9zSyutVWTeP8eaW5VCOSIi1E8TAnnRj7us+vTVg0O3Ua1uIYxvJdLNTN4zL0jw4tAm2iDJETgB1R2gEAymzQK3XtZv0SE2I3P6qlvQYw/socbdnnujPs6exMaVkJdjMUXTkjYm5Vn+ok4o1KKQJnqhpWv76qnbM/OBoQWqEKM5GBZPxl7uCleAMWKTozcCiES5ztibT+5tyf1saxD8QyPhrLF2tStP9NnUeq7dQ4eRV8+9A3LnawfNgbn7frD8L518eGQZEwo4HlXfXW0ZpXflYcHV1xn4JHGxUyMpbkuy0Gw+HA++IpfjsooPcWhDOJg3eCCvPEInj8HprHhxbdeVBo4l/hrlQIWwGgLnCkZl/saCyo1VCcnVJE3rzqvZbue3rFei1SDKh0KRQheJRmX7VYa1cUy49wsWP8vXJhCOwDx9lYbX3jAE= mathis@mathis-VirtualBox" >> /home/vagrant/.ssh/authorized_keys
    #   echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDAiP8+3Ob+mGUGNw2zpyQqzTVdU7QOZtv8fnz82Nq2JKJ+AG5CE2Hd8uQsnaFufJhTALyoCVHigTOsocaSf342c0SI7nYdSX7ivkOgSiuznper/aQyGx3avMJAKWuPQB6WdHP4usN6uhYeMuW0YmpiszrwwrIG25h0je9HYSdf3OVTVrF8mqrNGR+wCsNuR7XT3zZ2em5zm/pbavcfrOtmisp0pGLB4rngln7aQ5SBwoMiyD6ywHOZp03UmnogR/pj3pFOtl+xrKXtNe7rdWVr1IBbMj4h5ZesR9eGQGkdcVlOMVsJbCT4hdtt9TkU7UefzB48HsO45kWe9bTIoRrh9NsRo8pkcdcrvYFfIK5HFO4BiyBNm/XdVSFs/6IFcB1S580BvdF6/8LEVvzQJCQQow0FVcs2m9o8lcOu6JyhuLQer6pQRt0eTfUAh3I7nM1noYd+FBxwLh3GisxywW/15+OoRt1C/2SI7O/fWjcioXJWgMX7Uz1VrrnP8V9p8a8= mcatal-d@e3r7p11.42.fr" >> /home/vagrant/.ssh/authorized_keys
    #   chmod 600 /home/vagrant/.ssh/authorized_keys
    #   chown -R vagrant:vagrant /home/vagrant/.ssh
    # SHELL
  # end


  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # NOTE: This will enable public access to the opened port
  # config.vm.network "forwarded_port", guest: 80, host: 8080

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine and only allow access
  # via 127.0.0.1 to disable public access
  # config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"

  # Disable the default share of the current code directory. Doing this
  # provides improved isolation between the vagrant box and your host
  # by making sure your Vagrantfile isn't accessible to the vagrant box.
  # If you use this you may want to enable additional shared subfolders as
  # shown above.
  # config.vm.synced_folder ".", "/vagrant", disabled: true

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  # config.vm.provider "virtualbox" do |vb|
  #   # Display the VirtualBox GUI when booting the machine
  #   vb.gui = true
  #
  #   # Customize the amount of memory on the VM:
  #   vb.memory = "1024"
  # end
  #
  # View the documentation for the provider you are using for more
  # information on available options.

  # Enable provisioning with a shell script. Additional provisioners such as
  # Ansible, Chef, Docker, Puppet and Salt are also available. Please see the
  # documentation for more information about their specific syntax and use.
  # config.vm.provision "shell", inline: <<-SHELL
  #   apt-get update
  #   apt-get install -y apache2
  # SHELL
# end
