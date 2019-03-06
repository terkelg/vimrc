DIR := "${CURDIR}/coc-settings.json"
EXTENSIONS := "coc-tsserver coc-snippets coc-css coc-highlight coc-pairs coc-html"

setup: dependencies link install

dependencies:
	brew install yarn
	brew install watchman

link: 
	ln -s ${DIR} ~/.config/nvim/coc-settings.json

install:
	nvim --headless +PlugInstall +UpdateRemotePlugins +qall
	cd ~/.config/coc/extensions
	yarn add "${EXTENSIONS}"
