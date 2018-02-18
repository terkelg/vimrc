" Modeline and Notes {{
" vim: set sw=2 ts=2 sts=0 et fmr={{,}} fcs=vert\:| fdm=marker fdt=substitute(getline(v\:foldstart),'\\"\\s\\\|\{\{','','g') nospell:
"
" - To override the settings of a color scheme, create a file
"   after/colors/<theme name>.vim It will be automatically loaded after the
"   color scheme is activated.
"
" - For UTF-8 symbols to be displayed correctly (e.g., in the status line),
"   you may need to check "Set locale environment variables on startup" in
"   Terminal.app's preferences, or "Set locale variables automatically" in
"   iTerm's Terminal settings. If UTF-8 symbols are not displayed in remote
"   sessions (that is, when you run Vim on a remote machine to which you are
"   connected via SSH), make sure that the following line is *not* commented
"   in the client's /etc/ssh_config:
"
"       SendEnv LANG LC_*
"
"   As a last resort, you may set LC_ALL and LANG manually on the server; e.g.,
"   put these in your remote machine's .bash_profile:
"
"       export LC_ALL=en_US.UTF-8
"       export LANG=en_US.UTF-8
" }}
" Environment {{
  set encoding=utf-8
  scriptencoding utf-8
  set nobomb
  set fileformats=unix,mac,dos
  if has('langmap') && exists('+langremap') | set nolangremap | endif
  set timeoutlen=5000
  set ttimeout
  set ttimeoutlen=10  " This must be a low value for <esc>-key not to be confused with an <a-…> mapping
  set ttyfast
  set mouse=a
  if has('nvim')
    " NeoVim {{
    language en_US.UTF-8
    let g:terminal_scrollback_buffer_size = 10000
    set shada=!,'1000,<50,s10,h  " Override viminfo setting
    " Use alt-arrows in the command line (see :help map-alt-keys)
    cmap <a-b> <s-left>
    cmap <a-f> <s-right>
    " }}
  else
    " Vim {{
    set viminfo=!,'100,<10000,s10,h,n~/.vim/viminfo
    " See :set termcap, :h t_ku, :h :set-termcap, and http://vim.wikia.com/wiki/Mapping_fast_keycodes_in_terminal_Vim
    " For terminal mappings, see Key Mappings section
    set <s-left>=b  " There's a literal Esc (^[) here and below (it may be invisible, e.g., in GitHub)
    set <s-right>=f
    set <a-h>=h
    set <a-j>=j
    set <a-k>=k
    set <a-l>=l
    if $TERM =~# '^\%(tmux\|screen\)'
      set ttymouse=xterm2
      " Make bracketed paste mode work inside tmux:
      let &t_BE = "\033[?2004h"
      let &t_BD = "\033[?2004l"
      let &t_PS = "\033[200~"
      let &t_PE = "\033[201~"
    endif
    if has('mouse_sgr')
      set ttymouse=sgr " See :h sgr-mouse
    endif
    " }}
  endif
  set updatetime=500 " Trigger CursorHold event after half a second
  syntax enable
  filetype on " Enable file type detection
  filetype plugin on " Enable loading the plugin files for specific file types
  filetype indent on " Load indent files for specific file types
  set sessionoptions-=options " See FAQ at https://github.com/tpope/vim-pathogen
  set autoread " Re-read file if it is changed by an external program
  set hidden " Allow buffer switching without saving
  " Consolidate temporary files in a central spot
  set backupdir=~/.vim/tmp/backup
  set directory=~/.vim/tmp/swap
  set undofile " Enable persistent undo
  set undodir=~/.vim/tmp/undo
  set undolevels=1000 " Maximum number of changes that can be undone
  set undoreload=10000 " Maximum number of lines to save for undo on a buffer reload
" }}
" Editing {{
  set autoindent " Use indentation of the first-line when reflowing a paragraph
  set shiftround " Round indent to multiple of shiftwidth (applies to < and >)
  set backspace=indent,eol,start " Intuitive backspacing in insert mode
  set whichwrap+=<,>,[,],h,l " More intuitive arrow movements
  " Smooth scrolling that works both in terminal and in GUI Vim
  " nnoremap <silent> <c-u> :call <sid>smoothScroll(1)<cr>
  " nnoremap <silent> <c-d> :call <sid>smoothScroll(0)<cr>
  " Scroll the viewport faster
  nnoremap <c-e> <c-e><c-e>
  nnoremap <c-y> <c-y><c-y>
  set nrformats=hex
  set nojoinspaces " Prevents inserting two spaces after punctuation on a join (J)
  set splitright " When splitting vertically, focus goes to the right window
  set splitbelow " When splitting horizontally, focus goes to the bottom window
  set formatoptions+=1j " Do not wrap after a one-letter word and remove extra comment when joining lines
  set smarttab
  set expandtab " Use soft tabs by default
  " Use two spaces for tab by default
  set tabstop=2
  set shiftwidth=2
  set softtabstop=2
" }}
" Find, replace, and completion {{
  set nohlsearch " Do not highlight search results
  set incsearch " Search as you type
  set ignorecase " Case-insensitive search by default
  set infercase " Smart case when doing keyword completion
  set smartcase " Use case-sensitive search if there is a capital letter in the search expression
  if executable('rg')
    set grepprg=rg\ -i\ --vimgrep
  endif
  set grepformat^=%f:%l:%c:%m
  set keywordprg=:help " Get help for word under cursor by pressing K
  set complete+=i      " Use included files for completion
  set complete+=kspell " Use spell dictionary for completion, if available
  set completeopt+=menuone,noselect
  set completeopt-=preview
  set tags=./tags;,tags " Search upwards for tags by default
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
  endif
  set termguicolors
  let g:default_scrolloff = 2
  let &scrolloff=g:default_scrolloff " Keep some context when scrolling
  set sidescrolloff=5 " Ditto, but for horizontal scrolling
  set display=lastline
  " Get more information from ctrl-g:
  nnoremap <c-g> 2<c-g>
  " Show block cursor in Normal mode and line cursor in Insert mode:
  let &t_ti.="\e[1 q"
  let &t_SI.="\e[5 q"
  let &t_EI.="\e[1 q"
  let &t_te.="\e[0 q"
  set notitle " Do not set the terminal title
  set number " Turn line numbering on
  set relativenumber " Display line numbers relative to the line with the cursor
  set nowrap " Don't wrap lines by default
  set linebreak " If wrapping is enabled, wrap at word boundaries
  set laststatus=2 " Always show status line
  set showtabline=2 " Always show the tab bar
  set cmdheight=2 " Increase space for command line
  set shortmess+=Icm " No intro, suppress ins-completion messages, use [+] instead of [Modified]
  set showcmd " Show (partial) command in the last line of the screen
  set diffopt+=vertical " Diff in vertical mode
  set listchars=tab:▸\ ,trail:∙,space:∙,eol:¬,nbsp:▪,precedes:⟨,extends:⟩  " Invisible characters
  let &showbreak='↪ '
  set tabpagemax=50
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
  augroup END
" }}
" Status line {{
  " See :h mode() (some of these are never used in the status line)
  let g:mode_map = {
        \  'n': ['NORMAL',  'NormalMode' ],     'no': ['PENDING', 'NormalMode'  ],  'v': ['VISUAL',  'VisualMode' ],
        \  'V': ['V-LINE',  'VisualMode' ], "\<c-v>": ['V-BLOCK', 'VisualMode'  ],  's': ['SELECT',  'VisualMode' ],
        \  'S': ['S-LINE',  'VisualMode' ], "\<c-s>": ['S-BLOCK', 'VisualMode'  ],  'i': ['INSERT',  'InsertMode' ],
        \ 'ic': ['COMPLETE','InsertMode' ],     'ix': ['CTRL-X',  'InsertMode'  ],  'R': ['REPLACE', 'ReplaceMode'],
        \ 'Rc': ['COMPLETE','ReplaceMode'],     'Rv': ['REPLACE', 'ReplaceMode' ], 'Rx': ['CTRL-X',  'ReplaceMode'],
        \  'c': ['COMMAND', 'CommandMode'],     'cv': ['COMMAND', 'CommandMode' ], 'ce': ['COMMAND', 'CommandMode'],
        \  'r': ['PROMPT',  'CommandMode'],     'rm': ['-MORE-',  'CommandMode' ], 'r?': ['CONFIRM', 'CommandMode'],
        \  '!': ['SHELL',   'CommandMode'],      't': ['TERMINAL', 'CommandMode']}

  let g:ro_sym  = "RO"
  let g:ma_sym  = "✗"
  let g:mod_sym = "◦"
  let g:ff_map  = { "unix": "␊", "mac": "␍", "dos": "␍␊" }

  " newMode may be a value as returned by mode(1) or the name of a highlight group
  " Note: setting highlight groups while computing the status line may cause the
  " startup screen to disappear. See: https://github.com/powerline/powerline/issues/250
  fun! s:updateStatusLineHighlight(newMode)
    execute 'hi! link CurrMode' get(g:mode_map, a:newMode, ["", a:newMode])[1]
    return 1
  endf

  " nr is always the number of the currently active window. In a %{} context, winnr()
  " always refers to the window to which the status line being drawn belongs. Since this
  " function is invoked in a %{} context, winnr() may be different from a:nr. We use this
  " fact to detect whether we are drawing in the active window or in an inactive window.
  fun! SetupStl(nr)
    return get(extend(w:, {
          \ "lf_active": winnr() != a:nr
            \ ? 0
            \ : (mode(1) ==# get(g:, "lf_cached_mode", "")
              \ ? 1
              \ : s:updateStatusLineHighlight(get(extend(g:, { "lf_cached_mode": mode(1) }), "lf_cached_mode"))
              \ ),
          \ "lf_winwd": winwidth(winnr())
          \ }), "", "")
  endf

  " Build the status line the way I want - no fat light plugins!
  fun! BuildStatusLine(nr)
    return '%{SetupStl('.a:nr.')}
          \%#CurrMode#%{w:["lf_active"] ? "  " . get(g:mode_map, mode(1), [mode(1)])[0] . (&paste ? " PASTE " : " ") : ""}%*
          \ %{winnr()}/%{bufnr("%")} %{&modified ? g:mod_sym : ""} %t %{&modifiable ? (&readonly ? g:ro_sym : "  ") : g:ma_sym}
          \ %<%{w:["lf_winwd"] < 80 ? (w:["lf_winwd"] < 50 ? "" : expand("%:p:h:t")) : expand("%:p:h")}
          \ %=
          \ %w %{&ft} %{w:["lf_winwd"] < 80 ? "" : " " . (strlen(&fenc) ? &fenc : &enc) . (&bomb ? ",BOM " : " ")
          \ . get(g:ff_map, &ff, "?") . (&expandtab ? " ˽ " : " ⇥ ") . &tabstop}
          \ %#CurrMode#%{w:["lf_active"] ? (w:["lf_winwd"] < 60 ? ""
          \ : printf(" %d:%-2d %2d%% ", line("."), virtcol("."), 100 * line(".") / line("$"))) : ""}
          \%#Warnings#%{w:["lf_active"] ? get(b:, "lf_stl_warnings", "") : ""}%*'
  endf
" }}
" Tabline {{
  fun! BuildTabLabel(nr)
    return " " . a:nr
          \ . (empty(filter(tabpagebuflist(a:nr), 'getbufvar(v:val, "&modified")')) ? " " : " " . g:mod_sym . " ")
          \ . (get(extend(t:, {
          \ "tablabel": fnamemodify(bufname(tabpagebuflist(a:nr)[tabpagewinnr(a:nr) - 1]), ":t")
          \ }), "tablabel") == "" ? "[No Name]" : get(t:, "tablabel")) . "  "
  endf

  fun! BuildTabLine()
    return (tabpagenr('$') == 1 ? '' : join(map(
          \   range(1, tabpagenr('$')),
          \   '(v:val == tabpagenr() ? "%#TabLineSel#" : "%#TabLine#") . "%".v:val."T %{BuildTabLabel(".v:val.")}"'
          \ ), ''))
          \ . "%#TabLineFill#%T%=⌘ %<%{getcwd()} " . (tabpagenr('$') > 1 ? "%999X✕ " : "")
  endf

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

  fun! s:enableStatusLine()
    if exists("g:default_stl") | return | endif
    augroup lf_warnings
      autocmd!
      autocmd BufReadPost,BufWritePost * call <sid>update_warnings()
    augroup END
    set noshowmode " Do not show the current mode because it is displayed in the status line
    set noruler
    let g:default_stl = &statusline
    let g:default_tal = &tabline
    set statusline=%!BuildStatusLine(winnr()) " winnr() is always the number of the *active* window
    set tabline=%!BuildTabLine()
  endf

  fun! s:disableStatusLine()
    if !exists("g:default_stl") | return | endif
    let &tabline = g:default_tal
    let &statusline = g:default_stl
    unlet g:default_tal
    unlet g:default_stl
    set ruler
    set showmode
    autocmd! lf_warnings
    augroup! lf_warnings
  endf

  " Update trailing space and mixed indent warnings for the current buffer.
  fun! s:update_warnings()
    if exists('b:lf_no_warnings')
      unlet! b:lf_stl_warnings
      return
    endif
    if exists('b:lf_large_file')
      let b:lf_stl_warnings = '  Large file '
      return
    endif
    let l:trail  = search('\s$',       'cnw')
    let l:spaces = search('^\s\{-} ',  'cnw')
    let l:tabs   = search('^\s\{-}\t', 'cnw')
    if l:trail || (l:spaces && l:tabs)
      let b:lf_stl_warnings = '  '
            \ . (l:trail            ? 'Trailing space ('.l:trail.') '           : '')
            \ . (l:spaces && l:tabs ? 'Mixed indent ('.l:spaces.'/'.l:tabs.') ' : '')
    else
      unlet! b:lf_stl_warnings
    endif
  endf
" }}
" Commands (plugins excluded) {{
  " Custom status line
  command! -nargs=0 EnableStatusLine call <sid>enableStatusLine()
  command! -nargs=0 DisableStatusLine call <sid>disableStatusLine()

  " Clean up old undo files
  command! -nargs=0 CleanUpUndoFiles !find ~/.vim/tmp/undo -type f -mtime +100d \! -name '.gitignore' -delete
" }}
" Key mappings (plugins excluded) {{
  " Use space as alternative leader
  map <space> <leader>
  set pastetoggle=<f9>
  " Change to the directory of the current file
  nnoremap <silent> cd :<c-u>cd %:h \| pwd<cr>
  " Square bracket mappings (many of them inspired by Unimpaired)
  nnoremap <silent> [<space> :<c-u>put!=repeat(nr2char(10),v:count1)<cr>']+1
  nnoremap <silent> ]<space> :<c-u>put=repeat(nr2char(10),v:count1)<cr>'[-1
  " Window navigation
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
  " Allow using alt in macOS without enabling “Use Option as Meta key”
  nmap ¬ <a-l>
  nmap ˙ <a-h>
  nmap ∆ <a-j>
  nmap ˚ <a-k>
  " Easier copy/pasting to/from OS clipboard
  nnoremap <leader>y "*y
  vnoremap <leader>y "*y
  nnoremap <leader>Y "*Y
  nnoremap <leader>p "*p
  vnoremap <leader>p "*p
  nnoremap <leader>P "*P
  vnoremap <leader>P "*P
  " Use Alt+arrows to jump between words
  if has('terminal')
    tnoremap <s-left> <esc>b
    tnoremap <s-right> <esc>f
  endif
  " Buffers
  nnoremap          <leader>bb :<c-u>ls<cr>:b<space>
  " Files
  nnoremap          <leader>ff :<c-u>Files<cr>
  nnoremap          <leader>fa :<c-u>FilesAll<cr>
  nnoremap          <leader>fi :<c-u>FilesIn<cr>
  nnoremap <silent> <leader>fw :<c-u>update<cr>
  nnoremap <silent> <leader>w  :<c-u>update<cr>
  nnoremap          <leader>fW :<c-u>w !sudo tee % >/dev/null<cr>
  " Options
  nnoremap <silent> <leader>oc :<c-u>setlocal cursorline!<cr>
  nnoremap <silent> <leader>oh :<c-u>set hlsearch! \| set hlsearch?<cr>
  nnoremap <silent> <leader>oi :<c-u>set ignorecase! \| set ignorecase?<cr>
  nnoremap <silent> <leader>ok :<c-u>let &l:scrolloff = (&l:scrolloff == 999) ? g:default_scrolloff : 999<cr>
  nnoremap <silent> <leader>ol :<c-u>setlocal list!<cr>
  nnoremap <silent> <leader>on :<c-u>setlocal number!<cr>
  nnoremap <silent> <leader>or :<c-u>setlocal relativenumber!<cr>
  nnoremap <silent> <leader>os :<c-u>setlocal spell! \| set spell?<cr>
  nnoremap <silent> <leader>ot :<c-u>setlocal expandtab!<cr>
  " View/toggle
  nnoremap <silent> <leader>vm :<c-u>marks<cr>
  nnoremap <silent> <leader>vs :<c-u>let &laststatus=2-&laststatus<cr>
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
  " MUcomplete {{
    nnoremap <silent> <leader>oa :<c-u>MUcompleteAutoToggle<cr>
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
  " Nerdtree {{
    nnoremap <silent> <leader>vn :<c-u>if !exists("g:loaded_nerdtree")<bar>packadd nerdtree<bar>endif<cr>:NERDTreeToggle<cr>
    " close vim if the only window left open is a NERDTree<Paste>
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
  " }}
  " fzf {{
    " :Files add ! for fullscreen, toggle preview with ?
    command! -bang -nargs=? -complete=dir Files call fzf#vim#files(<q-args>, <bang>0 ? fzf#vim#with_preview('right:50%') : fzf#vim#with_preview('right:50%:hidden', '?'), <bang>0)
    " Like files, but including hidden files - overwrite default fzf command that don't include hidden files
    command! -bang -nargs=* -complete=dir FilesAll call fzf#run(fzf#wrap({
          \ 'source': 'rg --files --hidden --no-ignore --follow --ignore-case'}, <bang>0))
    " Serch in files with rg - https://medium.com/@crashybang/supercharge-vim-with-fzf-and-ripgrep-d4661fc853d2
    let g:files_command = '
          \ rg --column --line-number --fixed-strings --ignore-case --no-ignore --hidden --follow --color "always"
          \ -g "!{.git,node_modules,build,yarn.lock,dist}/*" '
    command! -bang -nargs=* FilesIn call fzf#vim#grep(g:files_command .shellescape(<q-args>), 1, <bang>0 ? fzf#vim#with_preview('up:60%') : fzf#vim#with_preview('right:50%', '?'), <bang>0)
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

  EnableStatusLine

  " Local settings
  let s:vimrc_local = fnamemodify(resolve(expand('<sfile>:p')), ':h').'/vimrc_local'
  if filereadable(s:vimrc_local)
    execute 'source' s:vimrc_local
  else
    colorscheme one
  endif
" }}
