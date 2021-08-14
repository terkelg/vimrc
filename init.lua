local vim = vim
local g = vim.g

-- load plugins
require 'plugins'

-- autocomplete configuration
require 'plugins.compe-config'
-- langauge server configuration
require 'lsp-config'
-- general configurations
require 'options'
-- lualine configuration
require 'plugins.statusline'
-- nvim-bufferline.lua configuration
require 'plugins.top-bufferline'
-- fuzzy finder configuration
require 'plugins.telescope-config'
-- configuration to help you remember keybindings
require 'plugins.which-key-config'
-- Git changes(showing in line number) configuration
require 'plugins.gitsigns-config'
-- nvim tree
require 'plugins.nvimtree-config'
-- extra plugins(with shorter configs)
require 'plugins.misc'

-- source our mappings last(may change)
vim.cmd 'source ~/.config/nvim/viml/maps.vim'
-- auto-commands
vim.cmd 'source ~/.config/nvim/viml/autocmd.vim'
