" Modeline and Notes {{
" vim: set sw=2 ts=2 sts=0 et fdm=marker :nospell:
"  __     ___
"  \ \   / (_)_ __ ___  _ __ ___
"   \ \ / /| | '_ ` _ \| '__/ __|
"    \ V / | | | | | | | | | (__
"     \_/  |_|_| |_| |_|_|  \___|
"     - Terkel Gjervig
"
"   This is a lighter version of my previous vimrc.
"   See old commits for more mappings.
" }}

" TODO
" - Update cheat40

" Install Plugins {{
  if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
          \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
  endif
  call plug#begin('~/.vim/plugged')
  Plug 'lifepillar/vim-cheat40'                " Cheat sheet for Vim
  Plug 'tpope/vim-commentary'                  " Add comments in blocks
  Plug 'tpope/vim-surround'                    " Enable inserting brackets around words
  Plug 'tpope/vim-repeat'                      " Enable . repeat for vim surround and others
  Plug 'can3p/incbool.vim'                     " Increment not only numbers but also true/false, show/hide etc.
  Plug 'justinmk/vim-sneak'                    " Jump Around!
  Plug 'editorconfig/editorconfig-vim'         " Respect editorconfig files
  Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' } " File browser
  Plug 'sheerun/vim-polyglot'                  " Syntax highlighting for more languages
  Plug 'rakr/vim-one'                          " A nice theme
  Plug 'arcticicestudio/nord-vim'              " Another nice theme
  Plug 'evanleck/vim-svelte', {'branch': 'main'} " Svelte syntax highlight
  Plug 'petrbroz/vim-glsl'                     " Shader GLSL highlighting
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'liuchengxu/vim-clap', {'do': ':Clap install-binary'}
  Plug 'mattn/emmet-vim'                       " Fast HTML writing
  call plug#end()
" }}

" Automatically reload vimrc when it's saved
autocmd! BufWritePost vimrc so ~/.vim/vimrc"

" Use correct terminal colors
if(has('termguicolors'))
    set termguicolors
endif

" Environment {{
  syntax on "enable syntax mode
  set encoding=utf-8 " utf8 everywhere
  set updatetime=500 " Trigger CursorHold event after half a second
  filetype on " Enable file type detection
  filetype plugin on " Enable loading the plugin files for specific file types
  filetype indent on " Load indent files for specific file types
  set autoread " Re-read file if it is changed by an external program
  set ttimeout
  set ttimeoutlen=10 " This must be a low value for <esc>-key not to be confused with an <a-…> mapping
" }}

" History and Backup {{
  " Consolidate temporary files in a central spot
  set backupdir=~/.vim/tmp/backup
  set directory=~/.vim/tmp/swap
  set undofile " Enable persistent undo
  set undodir=~/.vim/tmp/undo
" }}

" Apperance {{
  colorscheme nord " set colorscheme
  set background=dark
  set shortmess+=Im " No intro, use [+] instead of [Modified]
  let g:one_allow_italics=1 "allow italics
  let g:nord_bold = 1
  let g:nord_italic = 1
  let g:nord_italic_comments = 1
  let g:nord_underline = 1
" }}

" Editing {{
  set backspace=indent,eol,start " Intuitive backspacing in insert mode
  set nojoinspaces " Prevents inserting two spaces after punctuation on a join (J)
  set splitright splitbelow " When splitting focus goes to the bottom or right window
  set mouse=a " Enable mouse use in all modes
  set number " Turn line numbering on
  set relativenumber " Display line numbers relative to the line with the cursor
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
  set wildignore+=.DS_Store,Icon\?,*.dmg,*.git,*.o,*.obj,*.so,*.swp,*.zip,*.jpg,*.png,*.gif
  set wildmenu " Show possible matches when autocompleting
" }}

" Indentation {{
  set autoindent " Use indentation of the first-line when reflowing a paragraph
  set shiftround " Round indent to multiple of shiftwidth (applies to < and >)
  set tabstop=2 " Use two spaces for tab by default
  set shiftwidth=4
  set softtabstop=4
  set smarttab
  set expandtab " Use soft tabs by default
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

" Disabled Vim Plugins (performance) {{
  let g:loaded_getscriptPlugin = 1
  let g:loaded_gzip = 1
  let g:loaded_logiPat = 1
  let g:loaded_netrwPlugin = 1
  let g:loaded_rrhelper = 1
  let g:loaded_tarPlugin = 1
  let g:loaded_vimballPlugin = 1
  let g:loaded_zipPlugin = 1
" }}

" Space Space Space Space
map <space> <leader>

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

" Allow using alt/ctrl in macOS without enabling “Use Option as Meta key” {{
  " https://stackoverflow.com/questions/7501092/can-i-map-alt-key-in-vim
  nmap ¬ <a-l>
  nmap ˙ <a-h>
  nmap ∆ <a-j>
  nmap ˚ <a-k>
" }}

" Plugins {{
    " Clap {{
    nnoremap <leader><space> :<c-u>Clap<cr>
    nnoremap <leader>ff :<c-u>Clap files<cr>
    nnoremap <leader>fb :<c-u>Clap buffers<cr>
    nnoremap <leader>fh :<c-u>Clap files --hidden<cr>
    nnoremap <leader>fg :<c-u>Clap grep<cr>
    " }}

    " Nerdtree {{
    nnoremap <silent> <leader>vn :NERDTreeToggle<CR>
    " close vim if the only window left open is a NERDTree<Paste>
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
    " }}

    " Sneak {{
        let g:sneak#label = 1
    " }}

    " CoC {{
        " Plugins
        let g:coc_global_extensions = [
            \ 'coc-tsserver',
            \ 'coc-css',
            \ 'coc-json',
            \ 'coc-html',
            \ 'coc-dictionary',
            \ 'coc-omni',
            \ 'coc-pairs',
            \ 'coc-git',
            \ 'coc-lists',
            \ 'coc-snippets',
            \ 'coc-highlight',
            \ 'coc-prettier'
            \ ]

        " restart when tsserver gets wonky
        nnoremap <silent> <leader>cR  :<C-u>CocRestart<CR>

        " qf - quick fix
        nmap <leader>qf <Plug>(coc-fix-current)

        " expand snippets with enter
        inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
        inoremap <silent><expr> <TAB>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ coc#refresh()
        inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"    

        function! s:check_back_space() abort
        let col = col('.') - 1
        return !col || getline('.')[col - 1]  =~# '\s'
        endfunction
    " }}
"}}
