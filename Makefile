.DEFAULT_GOAL := help

help:
	@echo "Utilisez 'make env' pour créer un environnement virtuel et installer Ansible."
	@echo "Utilisez 'make vagrant' pour créer une machine vagrant."
	@echo "Utilisez 'make start' pour exécuter le playbook Ansible."

env:
	@echo "Creation de l'environnement virtuel..."
	@python3 -m venv ansible-env
	@. ansible-env/bin/activate && pip install ansible > /dev/null
	@tput setaf 2; echo "Pour activer dans l'environnement, exécutez 'source ansible-env/bin/activate'"; tput sgr0

start:
	ansible-playbook -i ansible-deploy-inception/inventory.ini ansible-deploy-inception/deploy.yml

vagrant:
	@echo "Creation de la machine vagrant..."
	@vagrant up
	@tput setaf 2; echo "Machine vagrant créée."; tput sgr0

.PHONY: help env start clean vagrant