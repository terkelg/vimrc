local vim = vim

-- Auto install paq if needed be
local fn = vim.fn
local install_path = fn.stdpath 'data' .. '/site/pack/paqs/start/paq-nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  fn.system {
    'git',
    'clone',
    '--depth=1',
    'https://github.com/savq/paq-nvim.git',
    install_path,
  }
end

require 'paq' {
  'savq/paq-nvim', -- Let Paq manage itself

  -- lib (dependencies)
  'nvim-lua/plenary.nvim',
  'nvim-lua/popup.nvim',
  'kyazdani42/nvim-web-devicons',

  -- Filebrowser
  { 'kyazdani42/nvim-tree.lua', opt = true },

  -- Lanuage Server
  'glepnir/lspsaga.nvim',
  'ray-x/lsp_signature.nvim',
  'kabouzeid/nvim-lspinstall',
  'nvim-treesitter/nvim-treesitter',
  'neovim/nvim-lspconfig',

  -- A nice status line
  'hoob3rt/lualine.nvim',

  -- Fuzzy find everything
  'nvim-telescope/telescope.nvim',
  { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },

  -- Like easymotion, sneak, and hop
  'ggandor/lightspeed.nvim',

  -- Tab like buffers
  'akinsho/nvim-bufferline.lua',

  -- Theme
  'folke/tokyonight.nvim',

  -- Import Costs
  { 'yardnsm/vim-import-cost', run = 'npm install'},

  -- Colorful brackets
  'p00f/nvim-ts-rainbow',

  -- Help my flawed memory
  'folke/which-key.nvim',

  -- Diagnostics, references, telescope results
  'folke/trouble.nvim',

  -- Highlight todo, warn and hack comments
  'folke/todo-comments.nvim',

  -- Easy block commenting
  'tpope/vim-commentary',

  -- Faste quoting/parenthesizing
  'tpope/vim-surround',

  -- Respect editor config
  'editorconfig/editorconfig-vim',

  -- Git
  { 'kdheepak/lazygit.nvim', opt = true },

  -- Gutter Git symbols
  'lewis6991/gitsigns.nvim',

  -- Smooth scrolling
  'yuttie/comfortable-motion.vim', -- Consider removing

  -- Fast completion
  { 'ms-jpq/coq_nvim', branch = 'coq' },

  'christoomey/vim-tmux-navigator',

  'gelguy/wilder.nvim',

  -- Language Specific
  'evanleck/vim-svelte',

  'tweekmonster/startuptime.vim',
}
