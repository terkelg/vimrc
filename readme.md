## Vimrc

> My sweet sweet vim configuration

- Foldable and thoroughly commented `vimrc`.
- Loads okay fast.
- Put your customizations into `vimrc_local`.
- Uses the built-in vim plugin manager.
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

### Credit

- Based on the amazing work from [lifepillar](https://github.com/lifepillar/vimrc).
- With inspiration from [yoshuawuyts](https://github.com/yoshuawuyts/dotfiles/blob/master/vim/vimrc)
- [Plugin Script](https://stories.abletech.nz/get-rid-of-your-vim-plugin-manager-7c8ff742f643)
