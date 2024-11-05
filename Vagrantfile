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

    
    config.vm.provider "virtualbox" do |vb|
      vb.memory = "2048" # Taille de la RAM en Mo (ici 2 Go)
      vb.cpus = 2        # Nombre de CPU alloués
      # vb.customize ["modifyvm", :id, "--basefolder", "/goinfre/mcatal-d/vagrant_vms"]
    end
  
    # Provisionner la machine avec Ansible
    config.vm.provision "shell", inline: <<-SHELL
      sudo apt update
      sudo apt install -y ansible git make gcc
      ansible-playbook -i /home/vagrant/ansible-deploy-inception/inventory.ini /home/vagrant/ansible-deploy-inception/deploy.yml
    SHELL

    # # add ssh key
    # config.vm.provision "shell", inline: <<-SHELL
    #   mkdir -p /home/vagrant/.ssh
    #   echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDFb3369x9G2XpSIrTd+lT49rqtCufQlc3tiiA3pKI5a6hvp4abgvClFCWgfP05E6474CDpL32Og9zSyutVWTeP8eaW5VCOSIi1E8TAnnRj7us+vTVg0O3Ua1uIYxvJdLNTN4zL0jw4tAm2iDJETgB1R2gEAymzQK3XtZv0SE2I3P6qlvQYw/socbdnnujPs6exMaVkJdjMUXTkjYm5Vn+ok4o1KKQJnqhpWv76qnbM/OBoQWqEKM5GBZPxl7uCleAMWKTozcCiES5ztibT+5tyf1saxD8QyPhrLF2tStP9NnUeq7dQ4eRV8+9A3LnawfNgbn7frD8L518eGQZEwo4HlXfXW0ZpXflYcHV1xn4JHGxUyMpbkuy0Gw+HA++IpfjsooPcWhDOJg3eCCvPEInj8HprHhxbdeVBo4l/hrlQIWwGgLnCkZl/saCyo1VCcnVJE3rzqvZbue3rFei1SDKh0KRQheJRmX7VYa1cUy49wsWP8vXJhCOwDx9lYbX3jAE= mathis@mathis-VirtualBox" >> /home/vagrant/.ssh/authorized_keys
    #   echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDAiP8+3Ob+mGUGNw2zpyQqzTVdU7QOZtv8fnz82Nq2JKJ+AG5CE2Hd8uQsnaFufJhTALyoCVHigTOsocaSf342c0SI7nYdSX7ivkOgSiuznper/aQyGx3avMJAKWuPQB6WdHP4usN6uhYeMuW0YmpiszrwwrIG25h0je9HYSdf3OVTVrF8mqrNGR+wCsNuR7XT3zZ2em5zm/pbavcfrOtmisp0pGLB4rngln7aQ5SBwoMiyD6ywHOZp03UmnogR/pj3pFOtl+xrKXtNe7rdWVr1IBbMj4h5ZesR9eGQGkdcVlOMVsJbCT4hdtt9TkU7UefzB48HsO45kWe9bTIoRrh9NsRo8pkcdcrvYFfIK5HFO4BiyBNm/XdVSFs/6IFcB1S580BvdF6/8LEVvzQJCQQow0FVcs2m9o8lcOu6JyhuLQer6pQRt0eTfUAh3I7nM1noYd+FBxwLh3GisxywW/15+OoRt1C/2SI7O/fWjcioXJWgMX7Uz1VrrnP8V9p8a8= mcatal-d@e3r7p11.42.fr" >> /home/vagrant/.ssh/authorized_keys
    #   chmod 600 /home/vagrant/.ssh/authorized_keys
    #   chown -R vagrant:vagrant /home/vagrant/.ssh
    # SHELL
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
    #   echo "ssh-rsa AAAAB3