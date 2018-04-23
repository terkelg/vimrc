## Vimrc

> My vim configuration

- Foldable and thoroughly commented `vimrc`.
- Loads pretty fast.
- Put your customizations into `vimrc_local`.
- Uses the built-in plugin manager.
- Move freely between Vim and tmux using `⌥-h/j/k/l`
  (plugin-free, requires [some configuration](https://github.com/lifepillar/dotfiles/blob/master/dot-tmux.conf) in tmux, too).
- 40-column **cheat sheet** always two keys away (courtesy of [Cheat40](https://github.com/lifepillar/vim-cheat40)).


### Requirements

- A fairly recent Vim (7.4 or later) (`brew install vim` recommended on macOS).

Recommended:

- Vim 8.
- [fzf](https://github.com/junegunn/fzf) (only the executable);
- [ripgrep](https://github.com/BurntSushi/ripgrep).


### Installation

```sh
    cd ~
    git clone https://github.com/terkelg/vimrc.git .vim
    cd .vim
    git checkout -b local
    # install/update plugins
    ./pack/install.sh
```


### Update

```sh
    cd ~/.vim
    git checkout master
    git pull origin master
    ./pack/install.sh
```

…and fix conflicts.


### Update plugins and colorschemes

Make sure the repo is in a clean state.

```sh
    ./pack/install.sh
```


### How to add a new plugin or colorscheme

To add a plugin edit the `pack/install.sh` file and run it

```sh
  ./pack/install.sh
```

> To add a colorscheme, change `bundle/start` with `themes/opt`.


### Credit

Based on the amazing work from [lifepillar](https://github.com/lifepillar/vimrc).
