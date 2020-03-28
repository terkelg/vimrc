" Modeline and Notes {{
" vim: set sw=2 ts=2 sts=0 et fdm=marker :nospell:
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
  set ttimeoutlen=10 " This must be a low value for <esc>-key not to be confused with an <a-…> mapping
  set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣
  set list
" }}
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
  Plug 'editorconfig/editorconfig-vim'         " Respect editorconfig files
  Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' } " File browser
  Plug 'sheerun/vim-polyglot'                  " Syntax highlighting for more languages
  Plug 'rakr/vim-one'                          " Another nice theme
  Plug 'evanleck/vim-svelte'                   " Svalte syntax highlight
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary' }
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
  set completeopt=noinsert,menuone,noselect
  set shortmess+=c " suppress the 'match x of y', 'The only match' and 'Pattern not found' messages
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
  " Get more information from ctrl-g:
  nnoremap <c-g> 2<c-g> 
" }}
" Statusline {{
  " start of default statusline
  set statusline=%f\ %h%w%m%r\ 

  " set statusline+=%#warningmsg#
  set statusline+=%{get(g:,'coc_git_status','')}%{get(b:,'coc_git_status','')}%{get(b:,'coc_git_blame','')}
  set statusline+=%*

  " end of default statusline (with ruler)
  set statusline+=%=%(%l,%c%V\ %=\ %P%)
" }}"
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
    autocmd FocusGained, BufEnter * :checktime 
    autocmd CursorHold,CursorHoldI * checktime

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
    nnoremap          <leader>bf :<c-u>CocList buffers<cr>
    nnoremap <silent> <leader>bw :<c-u>bw<cr>
    nnoremap <silent> <leader>bW :<c-u>bw!<cr>
    nnoremap <silent> ]b :<c-u><c-r>=v:count1<cr>bn<cr>
    nnoremap <silent> [b :<c-u><c-r>=v:count1<cr>bp<cr>
  " }}
  " Files/Find: f {{
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
  " Clap {{
    nnoremap <leader><space> :<c-u>Clap<cr>
    nnoremap <leader>ff :<c-u>Clap files<cr>
    nnoremap <leader>fh :<c-u>Clap files --hidden<cr>
    nnoremap <leader>fg :<c-u>Clap grep<cr>
  " }}
  " Nerdtree {{
    nnoremap <silent> <leader>vn :NERDTreeToggle<CR>
    " close vim if the only window left open is a NERDTree<Paste>
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
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
        \ 'coc-yank',
        \ 'coc-lists',
        \ 'coc-snippets',
        \ 'coc-highlight',
        \ 'coc-prettier',
        \ 'coc-smartf'
        \ ]

    " CocList {{
      " nnoremap <leader>ff :<c-u>CocList files<cr>
      " nnoremap <leader>fg :<c-u>CocList grep<cr>
      nnoremap <leader>fc :<c-u>CocList commits<cr>
      " nnoremap <leader>fh :<c-u>CocList files --hidden<cr>
      nnoremap <leader>fo :<C-u>CocList outline<cr>
      nnoremap <leader>fe :<C-u>CocList locationlist<cr>
      nnoremap <leader>fy :<C-u>CocList -A --normal yank<cr>
    " }}

    " Smartf {{
      " press <esc> to cancel.
      nmap f <Plug>(coc-smartf-forward)
      nmap F <Plug>(coc-smartf-backward)
      nmap ; <Plug>(coc-smartf-repeat)
      nmap , <Plug>(coc-smartf-repeat-opposite)

      augroup Smartf
        autocmd User SmartfEnter :hi Conceal ctermfg=220 guifg=#ff38F0
        autocmd User SmartfLeave :hi Conceal ctermfg=239 guifg=#504945
      augroup end
    " }}
    
    " Git {{
      " gs - show commit
      nmap <leader>gs <Plug>(coc-git-chunkinfo)

      " navigate chunks of current buffer
      nmap <silent>[g <Plug>(coc-git-prevchunk)
      nmap <silent>]g <Plug>(coc-git-nextchunk)
    " }}

    " qf - quick fix
    nmap <leader>qf <Plug>(coc-fix-current)

    " cr - rename the current word in the cursor
    nmap <leader>rn <Plug>(coc-rename)

    " gd - go to definition
    nmap <silent>gd <Plug>(coc-definition) 

    " gr - find references
    nmap <leader>gr <Plug>(coc-references)

    " gi - go to implementation
    nmap <leader>gi <Plug>(coc-implementation) 

    " co - Open link
    nmap <leader>co <Plug>(coc-openlink)

    " f - format selected - prettier
    nmap <leader>f <Plug>(coc-format-selected)
    vmap <leader>f <Plug>(coc-format-selected)

    " ca - run code actions
    vmap <leader>ca <Plug>(coc-codeaction-selected)
    nmap <leader>ca <Plug>(coc-codeaction)

    " restart when tsserver gets wonky
    nnoremap <silent> <leader>cR  :<C-u>CocRestart<CR>

    " Use `[c` and `]c` for navigate diagnostics
    nmap <silent>[c <Plug>(coc-diagnostic-prev)
    nmap <silent>]c <Plug>(coc-diagnostic-next)

    " Highlight symbol under cursor on CursorHold
    autocmd CursorHold * silent call CocActionAsync('highlight')

    " gh - get hint on whatever's under the cursor
    nmap <silent> K :call <SID>show_documentation()<CR>
    nmap <silent> gh :call <SID>show_documentation()<CR>
    function! s:show_documentation()
      if &filetype == 'vim'
        execute 'h '.expand('<cword>')
      else
        call CocAction('doHover')
      endif
    endfunction

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
" }}
" Themes {{
  " vimone {{
    let g:one_allow_italics = 1
  " }}
" }}
" Init {{
  colorscheme one
" }}
