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
  call plug#begin('~/.vim/plugged')
  Plug 'lifepillar/vim-cheat40'                " Cheat sheet for Vim
  Plug 'justinmk/vim-sneak'                    " Jump to any location specified by two characters
  Plug 'airblade/vim-gitgutter'                " Show git status in the sidebar
  Plug 'unblevable/quick-scope'                " Highlight characters to target for f, F
  Plug 'can3p/incbool.vim'                     " Increment not only numbers but also true/false, show/hide etc.
  Plug 'moll/vim-node'                         " Enable gf to open node modules
  Plug 'scrooloose/nerdtree'                   " File browser
  Plug 'tpope/vim-commentary'                  " Add comments in blocks
  Plug 'tpope/vim-surround'                    " Enable inserting brackets around words
  Plug 'tpope/vim-sleuth'                      " Automatically adjusts 'shiftwidth' and 'expandtab'
  Plug 'sheerun/vim-polyglot'                  " Syntax highlighting for more languages
  Plug 'joshdick/onedark.vim'                  " Nice theme      
  Plug 'rakr/vim-one'                          " Another nice theme
  Plug 'junegunn/vim-peekaboo'                 " See the contents of registers
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " fuzzy finder <3
  Plug 'junegunn/fzf.vim'

  Plug 'roxma/nvim-yarp'                       " A dependency of 'ncm2'.
  Plug 'ncm2/ncm2'                             " Auto complete
  Plug 'ncm2/ncm2-bufword'
  Plug 'ncm2/ncm2-tmux'
  Plug 'ncm2/ncm2-path'

  Plug 'autozimu/LanguageClient-neovim', {
        \ 'branch': 'next',
        \ 'do': 'bash install.sh',
        \ }
  call plug#end()
" }}
" History and Backup {{
  " Consolidate temporary files in a central spot
  set backupdir=~/.vim/tmp/backup
  set directory=~/.vim/tmp/swap
  set undofile " Enable persistent undo
  set undodir=~/.vim/tmp/undo
  set undolevels=1000 " Maximum number of changes that can be undone
  set undoreload=10000 " Maximum number of lines to save for undo on a buffer reload
  set history=1000 " Store lots of :cmdline history
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
  set scrolloff=10
  set sidescrolloff=15
  set sidescroll=1
  " Smooth scrolling that works both in terminal and in GUI Vim
  nnoremap <silent> <c-u> :call <sid>smoothScroll(1)<cr>
  nnoremap <silent> <c-d> :call <sid>smoothScroll(0)<cr>
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
  set viminfo='100,f1 " Save up to 100 marks, enable capital marks
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
  " Get more information from ctrl-g:
  nnoremap <c-g> 2<c-g>
  set notitle " Do not set the terminal title
  set number " Turn line numbering on
  set relativenumber " Display line numbers relative to the line with the cursor
  set laststatus=2 " Always show status line
  set cmdheight=1 " Increase space for command line
  set shortmess+=Icm " No intro, suppress ins-completion messages, use [+] instead of [Modified]
  set showcmd " Show (partial) command in the last line of the screen
  set diffopt+=vertical " Diff in vertical mode
  set listchars=tab:▸\ ,trail:∙,space:∙,eol:¬,nbsp:▪,precedes:⟨,extends:⟩  " Invisible characters
  let &showbreak='↪ '
" }}
" Cursor {{
  " Show block cursor in Normal mode and line cursor in Insert mode
  " (use odd numbers for blinking cursor):
  let &t_ti.="\e[2 q"
  let &t_SI.="\e[6 q"
  let &t_SR.="\e[4 q"
  let &t_EI.="\e[2 q"
  let &t_te.="\e[0 q"
" }}
" Autocommands {{
  augroup lf_autocmds
    autocmd!

    " Resize windows when the terminal window size changes (from http://vimrcfu.com/snippet/186)
    autocmd VimResized * wincmd =

    " If a file is large, disable syntax highlighting and other stuff
    autocmd BufReadPre * let s = getfsize(expand("<afile>")) | if s > g:LargeFile || s == -2 | call lf_buffer#large(expand("<afile>")) | endif

    " On opening a file, jump to the last known cursor position (see :h line())
    autocmd BufReadPost *
      \ if line("'\"") > 1 && line("'\"") <= line("$") && &ft !~# 'commit' |
      \   exe "normal! g`\"" |
      \ endif

    " Less intrusive swap prompt
    autocmd SwapExists * call lf_file#swap_exists(expand("<afile>"))

    " Don't auto insert a comment when using O/o for a newline
    autocmd VimEnter,BufRead,FileType * set formatoptions-=o

    " Automatically reload vimrc when it's saved
    autocmd! BufWritePost vimrc so ~/.vim/vimrc"

    " Automatically reload files when changed
    autocmd FocusGained * :checktime 

  augroup END
" }}
" Helper functions {{
  " See http://stackoverflow.com/questions/4064651/what-is-the-best-way-to-do-smooth-scrolling-in-vim
  fun! s:smoothScroll(up)
    execute "normal " . (a:up ? "\<c-y>" : "\<c-e>")
    redraw
    for l:count in range(3, &scroll, 2)
      sleep 10m
      execute "normal " . (a:up ? "\<c-y>" : "\<c-e>")
      redraw
    endfor
  endf
" }}
" Commands (plugins excluded) {{
  " Clean up old undo files
  command! -nargs=0 CleanUpUndoFiles !find ~/.vim/tmp/undo -type f -mtime +100d \! -name '.gitignore' -delete
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
  " Square bracket mappings (many of them inspired by Unimpaired) {{
    nnoremap <silent> [<space> :<c-u>put!=repeat(nr2char(10),v:count1)<cr>']+1
    nnoremap <silent> ]<space> :<c-u>put=repeat(nr2char(10),v:count1)<cr>'[-1
    nnoremap <silent> <leader>bn :<c-u>enew<cr>
    nnoremap <silent> [a :<c-u><c-r>=v:count1<cr>prev<cr>
    nnoremap <silent> ]a :<c-u><c-r>=v:count1<cr>next<cr>
    nnoremap <silent> ]b :<c-u><c-r>=v:count1<cr>bn<cr>
    nnoremap <silent> [b :<c-u><c-r>=v:count1<cr>bp<cr>
    nnoremap <silent> ]l :<c-u><c-r>=v:count1<cr>lnext<cr>zz
    nnoremap <silent> [l :<c-u><c-r>=v:count1<cr>lprevious<cr>zz
  " }}
  " Allow using alt in macOS without enabling “Use Option as Meta key” {{
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
  " Use Alt+arrows to jump between words {{
    if has('terminal')
      tnoremap <s-left> <esc>b
      tnoremap <s-right> <esc>f
    endif
  " }}
  " Buffers {{
    nnoremap          <leader>bb :<c-u>ls<cr>:b<space>
    nnoremap <silent> <leader>bn :<c-u>enew<cr>
    nnoremap          <leader>bf :<c-u>Buffers<cr>
    nnoremap <silent> <leader>bw :<c-u>bw<cr>
    nnoremap <silent> <leader>bW :<c-u>bw!<cr>
  " }}
  " Files {{
    nnoremap          <leader>ff :<c-u>Files<cr>
    nnoremap          <leader>fh :<c-u>FilesHidden<cr>
    nnoremap          <leader>fi :<c-u>FilesInside<cr>
    nnoremap          <leader>fl :<c-u>Lines<cr>
    nnoremap <silent> <leader>fw :<c-u>update<cr>
    nnoremap <silent> <leader>w  :<c-u>update<cr>
    nnoremap          <leader>fW :<c-u>w !sudo tee % >/dev/null<cr>
  " }}
  " Options {{
    nnoremap <silent> <leader>oc :<c-u>setlocal cursorline!<cr>
    nnoremap <silent> <leader>oh :<c-u>set hlsearch! \| set hlsearch?<cr>
    nnoremap <silent> <leader>oi :<c-u>set ignorecase! \| set ignorecase?<cr>
    nnoremap <silent> <leader>ok :<c-u>let &l:scrolloff = (&l:scrolloff == 999) ? g:default_scrolloff : 999<cr>
    nnoremap <silent> <leader>ol :<c-u>setlocal list!<cr>
    nnoremap <silent> <leader>on :<c-u>setlocal number!<cr>
    nnoremap <silent> <leader>or :<c-u>setlocal relativenumber!<cr>
    nnoremap <silent> <leader>os :<c-u>setlocal spell! \| set spell?<cr>
    nnoremap <silent> <leader>ot :<c-u>setlocal expandtab!<cr>
  " }}
  " View/toggle {{
    nnoremap <silent> <leader>vm :<c-u>marks<cr>
  " }}
" }}
" GUI {{
  if has('gui_running')
    let s:linespace=2
    set guifont=SF\ Mono\ Light:h11
    set guioptions=gm
    set guicursor=n-v-c:block-blinkwait700-blinkon700-blinkoff300,i-o-r-ci-cr:ver15-blinkwait700-blinkon700-blinkoff300
    let &linespace=s:linespace
    set transparency=0
    tnoremap <a-left> <esc>b
    tnoremap <a-right> <esc>f
  endif
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
  " Easy Align {{
    xmap <leader>ea <plug>(EasyAlign)
    nmap <leader>ea <plug>(EasyAlign)
  " }}
  " Sneak {{
    let g:sneak#label = 1
    let g:sneak#use_ic_scs = 1 " Match according to ignorecase and smartcase
  " }}
  " Undotree {{
    let g:undotree_WindowLayout = 2
    let g:undotree_SplitWidth = 40
    let g:undotree_SetFocusWhenToggle = 1
    let g:undotree_TreeNodeShape = '◦'
    nnoremap <silent> <leader>vu :<c-u>if !exists("g:loaded_undotree")<bar>packadd undotree<bar>endif<cr>:UndotreeToggle<cr>
  " }}
  " Vim-javascript {{
    let g:javascript_plugin_jsdoc = 1
  " }}
  " Quick-scope {{
    nnoremap <silent> <leader>oq :<c-u>QuickScopeToggle<cr>
  " }}
  " Nerdtree {{
    " nnoremap <silent> <leader>vn :<c-u>if !exists("g:loaded_nerdtree")<bar>packadd nerdtree<bar>endif<cr>:NERDTreeToggle<cr>
    nnoremap <silent> <leader>vn :NERDTreeToggle<CR>
    " close vim if the only window left open is a NERDTree<Paste>
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
  " }}
  " NCM2 {{
    autocmd BufEnter  *  call ncm2#enable_for_buffer() 
    " Use this mapping to close the menu and also start a new line on enter
    inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")
    " Use <TAB> to select the popup menu
    inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
    inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
  " }}
  " LanguageClient {{
    let g:LanguageClient_diagnosticsEnable = 0
    let g:LanguageClient_serverCommands = {
          \ 'javascript': ['javascript-typescript-stdio'],
          \ 'javascript.jsx': ['javascript-typescript-stdio']
          \ }
    nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
    nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
    nnoremap <silent> R :call LanguageClient#textDocument_rename()<CR>
  " }}
  " fzf {{
    " :Files add ! for fullscreen, toggle preview with ?
    command! -bang -nargs=? -complete=dir Files call fzf#vim#files(<q-args>, <bang>0 ? fzf#vim#with_preview('right:50%') : fzf#vim#with_preview('right:50%:hidden', '?'), <bang>0)
    " Like files, but including hidden files - overwrite default fzf command that don't include hidden files
    command! -bang -nargs=* -complete=dir FilesHidden call fzf#run(fzf#wrap({
          \ 'source': 'rg --files --hidden --no-ignore --follow --ignore-case'}, <bang>0))
    " Serch in files with rg - https://medium.com/@crashybang/supercharge-vim-with-fzf-and-ripgrep-d4661fc853d2
    let g:files_command = '
          \ rg --column --line-number --fixed-strings --ignore-case --no-ignore --hidden --follow --color "always"
          \ -g "!{.git,node_modules,build,yarn.lock,dist}/*" '
    command! -bang -nargs=* FilesInside call fzf#vim#grep(g:files_command .shellescape(<q-args>), 1, <bang>0 ? fzf#vim#with_preview('up:60%') : fzf#vim#with_preview('right:50%', '?'), <bang>0)
    nnoremap          <leader>fz :<c-u>FZF<cr>
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
  let g:LargeFile = 20*1024*1024 " 20MB

  " Local settings
  let s:vimrc_local = fnamemodify(resolve(expand('<sfile>:p')), ':h').'/vimrc_local'
  if filereadable(s:vimrc_local)
    execute 'source' s:vimrc_local
  else
    colorscheme one
  endif
" }}
