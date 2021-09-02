" Go to the beginning of the line in insert mode
inoremap <silent><C-a> <C-o>0
" Go to the ending of the line in insert mode
inoremap <silent><C-b> <C-o>$
" Paste from the system clipboard(in normal mode)
nnoremap <silent><leader>y "*y
" Paste from the system clipboard(in visual mode)
vnoremap <silent><leader>y "*y
" Cut from the system clipboard(in normal mode)
nnoremap <silent><leader>x "*x
" Cut from the system clipboard(in visual mode)
vnoremap <silent><leader>x "*x
" Paste from the system clipboard(in normal mode)
nnoremap <silent><leader>p "*p
" Paste from the system clipboard(in visual mode)
nnoremap <silent><leader>p "*p
" Select everything
nnoremap <silent><leader>a ggVG
" Delete a buffer
nnoremap <silent><leader>bd :bd<CR>
" Create a new blank buffer
nnoremap <leader>gg :enew<CR>
" Toggle search highlight
nnoremap <silent> <C-C> :if (&hlsearch == 1) \| set nohlsearch \| else \| set hlsearch \| endif<cr>
" Do not make Q go to ex-mode
nnoremap Q <Nop>
" Pick buffers in bufferline
nnoremap <silent> gb :BufferLinePick<CR>

" Faster split navigation
noremap <C-J> <C-W><C-J>
noremap <C-K> <C-W><C-K>
noremap <C-L> <C-W><C-L>
noremap <C-H> <C-W><C-H>   

" Disable arrow movement, resize splits instead
nnoremap <Up>    :resize +2<CR>
nnoremap <Down>  :resize -2<CR>
nnoremap <Left>  :vertical resize -2<CR>
nnoremap <Right> :vertical resize +2<CR>

" Create a floating terminal
nnoremap <silent><leader>` :ToggleTerm direction=float<CR>
nnoremap <silent><leader>tt :ToggleTerm<CR>
nnoremap <silent><leader>th :ToggleTerm direction=horizontal<CR>
nnoremap <silent><leader>ts :ToggleTerm direction=vertical<CR>
nnoremap <silent><leader><CR> :ToggleTerm direction=window<CR>
"
" Escape in terminal mode takes you to normal mode
tnoremap <silent><esc> <C-\><C-n>
" Support same window navigation in terminal
tnoremap <C-h> <C-\><C-n><C-W>h
tnoremap <C-j> <C-\><C-n><C-W>j
tnoremap <C-k> <C-\><C-n><C-W>k
tnoremap <C-l> <C-\><C-n><C-W>l

" Telescope
" Fuzzy file finder
nnoremap <silent><leader>ff :Telescope find_files hidden=true<CR>
" Fuzzy buffer finder
nnoremap <silent><leader>fb :Telescope buffers<CR>
" Fuzzy help-tages finder
nnoremap <silent><leader>fh :Telescope help_tags<CR>
" Search with ripgrep
nnoremap <silent><leader>fi :Telescope live_grep<CR>
" Fuzzy git status
nnoremap <silent><leader>fg :Telescope git_status<CR>
" Fuzzy old-files finder
nnoremap <silent><leader>fo :Telescope oldfiles<CR>
" Fuzzy file browser
nnoremap <silent><leader>fe :Telescope file_browser<CR>
" Fuzzy Todos
nnoremap <silent><leader>ft :TodoTelescope<CR>
" Fuzzy LSP
nnoremap <silent><leader>fa :Telescope lsp_code_actions<CR>
nnoremap <silent><leader>fd :Telescope lsp_definitions<CR>
nnoremap <silent><leader>fa :Telescope lsp_code_actions<CR>

inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Lspsaga
" Symobols Finder
nnoremap <silent>gh <cmd>lua require'lspsaga.provider'.lsp_finder()<CR>
" Show code actions
nnoremap <silent><leader>ca <cmd>lua require('lspsaga.codeaction').code_action()<CR>
" Show code actions for selection
vnoremap <silent><leader>ca :<C-U>lua require('lspsaga.codeaction').range_code_action()<CR>
" Show hovering documentation
nnoremap <silent>K <cmd>lua require('lspsaga.hover').render_hover_doc()<CR>
" Scroll down in lspsaga menus
nnoremap <silent> <C-f> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>
" Scroll up in lspsaga menus
nnoremap <silent> <C-b> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>
" Show signature help(imo not thaat useful)
nnoremap <silent>gs <cmd>lua require('lsopsaga.signaturehelp').signature_help()<CR>
" Rename symbols
nnoremap <silent>gr <cmd>lua require('lspsaga.rename').rename()<CR>
" Preview definition
nnoremap <silent>gd <cmd>lua require'lspsaga.provider'.preview_definition()<CR>
" Show suggestions/errors/warnings for the line
nnoremap <silent><leader>cd <cmd>lua require'lspsaga.diagnostic'.show_line_diagnostics()<CR>
nnoremap <silent><leader>cc <cmd>lua require'lspsaga.diagnostic'.show_cursor_diagnostics()<CR>
" Jump to the next diagnostic suggestion
nnoremap <silent>]e <cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_next()<CR>
" Jump to the previous diagnostic suggestion
nnoremap <silent>[e <cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_prev()<CR>

" Jump to definition
nnoremap <silent> gD <cmd>lua vim.lsp.buf.definition()<CR>

" Toggle error menu
nnoremap <silent><leader>h :TroubleToggle<CR>
" Show todo menu
nnoremap <silent><leader>ht :TodoTrouble<CR>
" Show blame for line
nnoremap <silent><leader>bb :Gitsigns toggle_current_line_blame<CR>

function! ToggleNvimTree()
  " https://github.com/kyazdani42/nvim-tree.lua/issues/547
  let g:nvim_tree_auto_close = 1
  if exists(":NvimTreeToggle") == 0
    silent! packadd nvim-tree.lua
  endif
  NvimTreeToggle
endfunction

" Call nvim-tree lazy load function
nnoremap <silent> <leader>nn :call ToggleNvimTree()<CR>

" Open LazyGit
function! ToggleLazyGit()
  if exists(":LazyGit") == 0
    silent! packadd Lazygit.nvim
  endif
  LazyGit
endfunction
nnoremap <silent> <leader>lg :call ToggleLazyGit()<CR>
