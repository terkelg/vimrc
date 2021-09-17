" Turn off line numbers and start insert mode in terminal
autocmd TermOpen * setlocal nonumber norelativenumber | startinsert

" Activate Wilder plugin
call wilder#enable_cmdline_enter()
call wilder#set_option('modes', ['/', '?'])

" Highlight yanked region
augroup highlight_yank
  autocmd!
  au TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=500}
augroup END
