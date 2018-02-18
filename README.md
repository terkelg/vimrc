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
    git clone --depth 1 https://github.com/lifepillar/vimrc.git .vim
    cd .vim
    git checkout -b local
    # We use shallow submodules; --remote makes sure we are able to check them out:
    git submodule update --init --remote
    # Commit changes (needed only if there are changes):
    git commit -a -m "Git submodule update --remote."
```


### Update

```sh
    cd ~/.vim
    git checkout master
    git pull origin master
    git submodule sync
    git submodule update --init --recursive
    git checkout local
    git rebase master
```

…and fix conflicts.


### Update plugins and colorschemes

Make sure the repo is in a clean state.

```sh
    git submodule update --remote --depth 1
    git commit -a
    git submodule update --recursive # Optional, only if there are plugins with submodules
```


### How to add a new plugin or colorscheme

To add a plugin `Foo` from `https://repo/foo.git`:

```sh
    git submodule add --name foo --depth 1 https://repo/foo.git pack/bundle/start/foo
    git config -f .gitmodules submodule.foo.shallow true
    git add .gitmodules
    git commit
```

To add `Foo` as an optional plugin, change `start` with `opt` (it works if Vim
has packages, otherwise you also have to add the plugin to
`g:pathogen_blacklist`).

> To add a colorscheme, change `bundle/start` with `themes/opt`.


### Credit

Based on the [lifepillar](https://github.com/lifepillar/vimrc).
