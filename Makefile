.DEFAULT_GOAL := help

help:
	@echo "Utilisez 'make env' pour créer un environnement virtuel et installer Ansible."
	@echo "Utilisez 'make vagrant' pour créer une machine vagrant."
	@echo "Utilisez 'make start' pour exécuter le playbook Ansible."
	@echo "Utilisez 'make reboot' pour redémarrer la machine."

env:
	@echo "Creation de l'environnement virtuel..."
	@python3 -m venv ansible-env
	@. ansible-env/bin/activate && pip install ansible > /dev/null
	@tput setaf 2; echo "Pour activer dans l'environnement, exécutez 'source ansible-env/bin/activate'"; tput sgr0

start:
	ssh-keygen -f "/mnt/nfs/homes/mcatal-d/.ssh/known_hosts" -R "192.168.56.10"
	ansible-playbook -i ansible-deploy-inception/inventory.ini ansible-deploy-inception/main.yml

vagrant:
	@echo "Creation de la machine vagrant..."
	@vagrant up
	@tput setaf 2; echo "Machine vagrant créée."; tput sgr0

reboot:
	ansible local -i ansible-deploy-inception/inventory.ini -m reboot -a reboot_timeout=3600 -b

.PHONY: help env start clean vagrant