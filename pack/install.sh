#!/usr/bin/env bash

# Create new folder in ~/.vim/pack that contains a start folder and cd into it.
#
# Arguments:
#   package_group, a string folder name to create and change into.
#
# Examples:
#   set_group syntax-highlighting
#
function set_group () {
  package_group=$1
  path="$HOME/.vim/pack/$package_group"
  mkdir -p "$path"
  cd "$path" || exit
}

# Clone or update a git repo in the current directory.
#
# Arguments:
#   repo_url, a URL to the git repo.
#
# Examples:
#   package https://github.com/tpope/vim-endwise.git
#
function package () {
  repo_url=$1
  run_cmd=$2

  if [[ "$repo_url" != http* ]]; then
    repo_url="https://github.com/${repo_url}"
  fi

  expected_repo=$(basename "$repo_url" .git)
  if [ -d "$expected_repo" ]; then
    cd "$expected_repo" || exit
    result=$(git pull --force)
    echo "$expected_repo: $result"
  else
    echo "$expected_repo: Installing..."
    git clone -q "$repo_url" --depth 1
  fi

  if [ ! -z "$run_cmd" ]; then
    echo "$expected_repo: Running post cmd..."
    eval $run_cmd
  fi
}


# Optional plugins
(
set_group bundle/opt
package https://github.com/scrooloose/nerdtree &
package https://github.com/mbbill/undotree.git &
wait
) &

# Start-up plugins
(
set_group bundle/start
# package https://github.com/w0rp/ale.git &
package https://github.com/junegunn/vim-easy-align.git &
package https://github.com/justinmk/vim-sneak.git &
package https://github.com/SirVer/ultisnips &
package https://github.com/can3p/incbool.vim &
package https://github.com/editorconfig/editorconfig-vim &
package https://github.com/moll/vim-node &
package https://github.com/pangloss/vim-javascript &
package https://github.com/unblevable/quick-scope &

package https://github.com/junegunn/vim-peekaboo &
package https://github.com/junegunn/fzf.vim &
package https://github.com/airblade/vim-gitgutter &
package https://github.com/lifepillar/vim-cheat40.git &

package https://github.com/tpope/vim-fugitive.git &
package https://github.com/tpope/vim-surround.git &
package https://github.com/tpope/vim-repeat.git &
package https://github.com/tpope/vim-commentary.git &
package https://github.com/tpope/vim-sleuth.git &

package https://github.com/autozimu/LanguageClient-neovim "./install.sh" &
# package https://github.com/lifepillar/vim-mucomplete &
wait
) &

# Themes
(
set_group themes/opt
package https://github.com/joshdick/onedark.vim &
package https://github.com/lifepillar/vim-wwdc16-theme.git &
package https://github.com/rakr/vim-one & 
wait
) &

wait

# Generate help docs
# vim +":helptags ~/.vim/pack" +":qa"

old_plugs=$(find ./*/*/*/*/.git -prune -mmin +5 -print | sed "s/\/.git//")
if [ -n "$old_plugs" ]; then
  echo "Removing old plugins:"
  echo $old_plugs | xargs rm -rf
fi
