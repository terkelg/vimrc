" Modeline and Notes {{
" vim: set sw=2 ts=2 sts=0 et fmr={{,}} fcs=vert\:| fdm=marker fdt=substitute(getline(v\:foldstart),'\\"\\s\\\|\{\{','','g') nospell:
"  __     ___
"  \ \   / (_)_ __ ___  _ __ ___
"   \ \ / /| | '_ ` _ \| '__/ __|
"    \ V / | | | | | | | | | (__
"     \_/  |_|_| |_| |_|_|  \___|
"
" }}
" Environment {{
  set encoding=utf-8 " utf8 everywhere
  set updatetime=500 " Trigger CursorHold event after half a second
  syntax enable " Syntax highlighting on
  filetype on " Enable file type detection
  filetype plugin on " Enable loading the plugin files for specific file types
  filetype indent on " Load indent files for specific file types
  set autoread " Re-read file if it is changed by an external program
  set hidden " Allow buffer switching without saving
  set timeoutlen=5000
  set ttimeout
  set ttimeoutlen=10  " This must be a low value for <esc>-key not to be confused with an <a-…> mapping
" }}
" Install Plugins {{
  if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
          \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
  endif
  call plug#begin('~/.vim/plugged')
  Plug 'lifepillar/vim-cheat40'                " Cheat sheet for Vim
  Plug 'justinmk/vim-sneak'                    " Jump to any location specified by two characters
  Plug 'airblade/vim-gitgutter'                " Show git status in the sidebar
  Plug 'unblevable/quick-scope'                " Highlight characters to target for f, F
  Plug 'can3p/incbool.vim'                     " Increment not only numbers but also true/false, show/hide etc.
  Plug 'editorconfig/editorconfig-vim'         " Respect editorconfig files
  Plug 'moll/vim-node'                         " Enable gf to open node modules
  Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' } " File browser
  Plug 'SirVer/ultisnips'                      " Snippets
  Plug 'tpope/vim-commentary'                  " Add comments in blocks
  Plug 'tpope/vim-surround'                    " Enable inserting brackets around words
  Plug 'tpope/vim-sleuth'                      " Automatically adjusts 'shiftwidth' and 'expandtab'
  Plug 'sheerun/vim-polyglot'                  " Syntax highlighting for more languages
  Plug 'joshdick/onedark.vim'                  " Nice theme      
  Plug 'rakr/vim-one'                          " Another nice theme
  Plug 'junegunn/vim-peekaboo'                 " See the contents of registers
  Plug 'Quramy/vim-js-pretty-template'         " Highlight template string contents
  Plug 'jason0x43/vim-js-indent'               " JavaScript and TypeScript indentation
  Plug 'Quramy/tsuquyomi'                      " Better TypeScript support
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " fuzzy finder <3
  Plug 'junegunn/fzf.vim'
  Plug 'w0rp/ale'                              " Linting and language server
  call plug#end()
" }}
" History and Backup {{
  " Consolidate temporary files in a central spot
  set backupdir=~/.vim/tmp/backup
  set directory=~/.vim/tmp/swap
  set undofile " Enable persistent undo
  set undodir=~/.vim/tmp/undo
" }}
" Mouse {{
  set mouse=a " Enable mouse use in all modes
  set ttyfast " Send more characters for redraws
" }}
" Editing {{
  set backspace=indent,eol,start " Intuitive backspacing in insert mode
  set nojoinspaces " Prevents inserting two spaces after punctuation on a join (J)
  set splitright " When splitting vertically, focus goes to the right window
  set splitbelow " When splitting horizontally, focus goes to the bottom window
" }}
" Scrolling {{
  " Scroll the viewport faster
  nnoremap <c-e> <c-e><c-e>
  nnoremap <c-y> <c-y><c-y>
  " Start scrolling when we're getting close to margins
  set scrolloff=10 " Minimal number of screen lines to keep above and below the cursor
  set sidescrolloff=15 " Minimal side scroll offset
  set sidescroll=1
" }}
" Indentation {{
  set autoindent " Use indentation of the first-line when reflowing a paragraph
  set shiftround " Round indent to multiple of shiftwidth (applies to < and >)
  set tabstop=2 " Use two spaces for tab by default
  set shiftwidth=2
  set softtabstop=2
  set smarttab
  set expandtab " Use soft tabs by default
" }}
" Wrapping {{
  set whichwrap+=<,>,[,],h,l " More intuitive arrow movements
  set nowrap " Don't wrap lines by default
  set linebreak " If wrapping is enabled, wrap at word boundaries
  set formatoptions+=1j " Do not wrap after a one-letter word and remove extra comment when joining lines
  set textwidth=80 " Show gutter at 80 chars
" }}
" Find, replace, and completion {{
  set incsearch " Search as you type
  set nohlsearch " Don't keep search highlight after search
  set ignorecase " Case-insensitive search by default
  set infercase " Smart case when doing keyword completion
  set smartcase " Use case-sensitive search if there is a capital letter in the search expression
  set complete+=i " Use included files for completion
  set complete+=kspell " Use spell dictionary for completion, if available
  set completeopt=menuone,noselect
  " Files and directories to ignore
  set wildignore+=.DS_Store,Icon\?,*.dmg,*.git,*.pyc,*.o,*.obj,*.so,*.swp,*.zip
  set wildmenu " Show possible matches when autocompleting
  set wildignorecase " Ignore case when completing file names and directories
" }}
" Appearance {{
  if has('termguicolors') && $COLORTERM ==# 'truecolor'
    let &t_8f = "\<esc>[38;2;%lu;%lu;%lum" " Needed in tmux
    let &t_8b = "\<esc>[48;2;%lu;%lu;%lum" " Ditto
    set termguicolors
    set background=dark
  endif
  set termguicolors 
  set display=lastline " prevent @ symbol on when lines doesn't fit 
  set notitle " Do not set the terminal title
  set number " Turn line numbering on
  set relativenumber " Display line numbers relative to the line with the cursor
  set laststatus=2 " Always show status line
  set cmdheight=1 " Increase space for command line
  set shortmess+=Im " No intro, use [+] instead of [Modified]
  set diffopt+=vertical " Diff in vertical mode
  set listchars=tab:▸\ ,trail:∙,space:∙,eol:¬,nbsp:▪,precedes:⟨,extends:⟩  " Invisible characters
  let &showbreak='↪ '
" }}
" Autocommands {{
  augroup lf_autocmds
    autocmd!

    " Resize windows when the terminal window size changes (from http://vimrcfu.com/snippet/186)
    autocmd VimResized * wincmd =

    " On opening a file, jump to the last known cursor position (see :h line())
    autocmd BufReadPost *
      \ if line("'\"") > 1 && line("'\"") <= line("$") && &ft !~# 'commit' |
      \   exe "normal! g`\"" |
      \ endif

    " Don't auto insert a comment when using O/o for a newline
    autocmd VimEnter,BufRead,FileType * set formatoptions-=o

    " Automatically reload vimrc when it's saved
    autocmd! BufWritePost vimrc so ~/.vim/vimrc"

    " Automatically reload files when changed
    autocmd FocusGained * :checktime 

  augroup END
" }}
" Key mappings (plugins excluded) {{
  " Use space as alternative leader
  map <space> <leader>
  " Move to last edit location and put it in the center of the screen
  nnoremap <C-o> <C-o>zz
  " Utilities {{
    " Change to the directory of the current file
    nnoremap <silent> cd :<c-u>cd %:h \| pwd<cr>
    " Reselect visual block after indent/outdent
    vnoremap < <gv
    vnoremap > >gv
  " }}
  " Window navigation {{
    nnoremap <leader>1 1<c-w>w
    nnoremap <leader>2 2<c-w>w
    nnoremap <leader>6 6<c-w>w
    nnoremap <leader>7 7<c-w>w
    nnoremap <leader>8 8<c-w>w
    nnoremap <leader>9 9<c-w>w
    nnoremap <leader>0 10<c-w>w
    if $TERM =~# '^\%(tmux\|screen\)'
      nnoremap <silent> <a-h> :<c-u>call lf_tmux#navigate('h')<cr>
      nnoremap <silent> <a-j> :<c-u>call lf_tmux#navigate('j')<cr>
      nnoremap <silent> <a-k> :<c-u>call lf_tmux#navigate('k')<cr>
      nnoremap <silent> <a-l> :<c-u>call lf_tmux#navigate('l')<cr>
    else
      nnoremap <a-l> <c-w>l
      nnoremap <a-h> <c-w>h
      nnoremap <a-j> <c-w>j
      nnoremap <a-k> <c-w>k
    endif
    " Disable arrow movement, resize splits instead
    nnoremap <Up>    :resize +2<CR>
    nnoremap <Down>  :resize -2<CR>
    nnoremap <Left>  :vertical resize +2<CR>
    nnoremap <Right> :vertical resize -2<CR>
    " Faster split navigation
    noremap <c-j> <c-w><c-j>
    noremap <c-k> <c-w><c-k>
    noremap <c-l> <c-w><c-l>
    noremap <c-h> <c-w><c-h>   
  " }}
  " Allow using alt in macOS without enabling “Use Option as Meta key” {{
    " https://stackoverflow.com/questions/7501092/can-i-map-alt-key-in-vim
    nmap ¬ <a-l>
    nmap ˙ <a-h>
    nmap ∆ <a-j>
    nmap ˚ <a-k>
  " }}
  " Easier copy/pasting to/from OS clipboard {{
    nnoremap <leader>y "*y
    vnoremap <leader>y "*y
    nnoremap <leader>Y "*Y
    nnoremap <leader>p "*p
    vnoremap <leader>p "*p
    nnoremap <leader>P "*P
    vnoremap <leader>P "*P
  " }}
  " Buffers: b {{
    nnoremap          <leader>bb :<c-u>ls<cr>:b<space>
    nnoremap <silent> <leader>bn :<c-u>enew<cr>
    nnoremap          <leader>bf :<c-u>Buffers<cr>
    nnoremap <silent> <leader>bw :<c-u>bw<cr>
    nnoremap <silent> <leader>bW :<c-u>bw!<cr>
  " }}
  " Files: f {{
    nnoremap          <leader>ff :<c-u>Files<cr>
    nnoremap          <leader>p  :<c-u>Files<cr>
    nnoremap          <leader>fh :<c-u>FilesHidden<cr>
    nnoremap          <leader>fi :<c-u>Rg<cr>
    nnoremap          <leader>fl :<c-u>Lines<cr>
    nnoremap <silent> <leader>fw :<c-u>update<cr>
    nnoremap <silent> <leader>w  :<c-u>update<cr>
    nnoremap          <leader>fW :<c-u>w !sudo tee % >/dev/null<cr>
  " }}
  " Options: o {{
    nnoremap <silent> <leader>oc :<c-u>setlocal cursorline!<cr>
    nnoremap <silent> <leader>oh :<c-u>set hlsearch! \| set hlsearch?<cr>
    nnoremap <silent> <leader>oi :<c-u>set ignorecase! \| set ignorecase?<cr>
    nnoremap <silent> <leader>on :<c-u>setlocal number!<cr>
    nnoremap <silent> <leader>or :<c-u>setlocal relativenumber!<cr>
  " }}
" }}
" Plugins {{
  " Disabled Vim Plugins {{
    let g:loaded_getscriptPlugin = 1
    let g:loaded_gzip = 1
    let g:loaded_logiPat = 1
    let g:loaded_netrwPlugin = 1
    let g:loaded_rrhelper = 1
    let g:loaded_tarPlugin = 1
    let g:loaded_vimballPlugin = 1
    let g:loaded_zipPlugin = 1
  " }}
  " Sneak {{
    let g:sneak#label = 1
    let g:sneak#use_ic_scs = 1 " Match according to ignorecase and smartcase
  " }}
  " Vim-javascript {{
    let g:javascript_plugin_jsdoc = 1
  " }}
  " Ale {{
    let g:ale_fix_on_save = 1
    let g:ale_completion_enabled = 1
    " Use a slightly slimmer error pointer
    let g:ale_sign_error = '✖'
    hi ALEErrorSign guifg=#DF8C8C
    let g:ale_sign_warning = '⚠'
    hi ALEWarningSign guifg=#F2C38F

    nnoremap          <leader>gd :ALEGoToDefinition<cr>
    nnoremap <silent> <leader>hv :ALEHover<cr>
    nnoremap <silent> <leader>fr :ALEFindReferences<cr>

    " Use ALT-[ and ALT-] to navigate errors
    nmap <silent> “ <Plug>(ale_previous_wrap)
    nmap <silent> ‘ <Plug>(ale_next_wrap)
  " }}
  " Quick-scope {{
    nnoremap <silent> <leader>oq :<c-u>QuickScopeToggle<cr>
  " }}
  " UltiSnips {{
    let g:UltiSnipsExpandTrigger="<c-e>"
  " }
  " Nerdtree {{
    " nnoremap <silent> <leader>vn :<c-u>if !exists("g:loaded_nerdtree")<bar>packadd nerdtree<bar>endif<cr>:NERDTreeToggle<cr>
    nnoremap <silent> <leader>vn :NERDTreeToggle<CR>
    " close vim if the only window left open is a NERDTree<Paste>
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
  " }}
  " fzf {{
    " :Files add ! for fullscreen, toggle preview with ?
    command! -bang -nargs=? -complete=dir Files
      \ call fzf#vim#files(<q-args>,
      \   <bang>0 ? fzf#vim#with_preview('up:60%')
      \           : fzf#vim#with_preview('right:50%:hidden', '?'),
      \   <bang>0)

    " Add support to toggle preview for :Rg aswell
    command! -bang -nargs=* Rg
      \ call fzf#vim#grep(
      \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
      \   <bang>0 ? fzf#vim#with_preview('up:60%')
      \           : fzf#vim#with_preview('right:50%:hidden', '?'),
      \   <bang>0)

    " Like files, but including hidden files - overwrite default fzf command that don't include hidden files
    command! -bang -nargs=* -complete=dir FilesHidden call fzf#run(fzf#wrap({
          \ 'source': 'rg --files --hidden --no-ignore --follow --ignore-case'}, <bang>0))

  " }}
" }}
" Themes {{
  " vimone {{
    let g:one_allow_italics = 1
  " }}
  " onedark {{
    let g:onedark_terminal_italics = 1
  " }}
" }}
" Init {{
  colorscheme one
" }}
