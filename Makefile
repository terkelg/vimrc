DIR := "${CURDIR}/coc-settings.json"

setup: dependencies link

dependencies:
	brew install yarn
	brew install watchman

link: 
	ln -s ${DIR} ~/.config/nvim/coc-settings.json
