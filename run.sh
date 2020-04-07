#!/usr/bin/env sh

export PATH="$HOME/Library/Python/2.7/bin:$PATH"
ansible-galaxy install -r requirements.yml && ansible-playbook playbook.yml -i inventory -K
