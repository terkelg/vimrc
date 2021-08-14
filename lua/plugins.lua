local vim = vim

require 'paq' {
  'savq/paq-nvim', -- Let Paq manage itself

  -- lib (dependencies)
  'nvim-lua/plenary.nvim',
  'nvim-lua/popup.nvim',
  'kyazdani42/nvim-web-devicons',

  -- Filebrowser
  { 'kyazdani42/nvim-tree.lua', opt = true },

  'glepnir/lspsaga.nvim',
  'kabouzeid/nvim-lspinstall',
  'nvim-treesitter/nvim-treesitter',
  'hrsh7th/nvim-compe',
  'neovim/nvim-lspconfig',
  'hoob3rt/lualine.nvim',

  -- Fuzzy find everything
  'nvim-telescope/telescope.nvim',

  -- Like easymotion, sneak, and hop
  'ggandor/lightspeed.nvim',

  -- Tab like buffers
  'akinsho/nvim-bufferline.lua',

  -- Theme
  'folke/tokyonight.nvim',

  -- Help my flawed memory
  'folke/which-key.nvim',

  -- Diagnostics, references, telescope results
  'folke/trouble.nvim',

  -- Highlight todo, warn and hack comments
  'folke/todo-comments.nvim',

  -- Zenmode
  { 'folke/zen-mode.nvim', opt = true },
  { 'folke/twilight.nvim', opt = true },

  -- Easy blog commenting
  'terrortylor/nvim-comment',

  -- Faste quoting/parenthesizing 
  'tpope/vim-surround',

  -- Git
  { 'kdheepak/lazygit.nvim', opt = true },

  -- Gutter Git symbols
  'lewis6991/gitsigns.nvim',

  -- Smooth scrolling
  'yuttie/comfortable-motion.vim', -- Consider removing
  
  'mhartington/formatter.nvim',
  'ray-x/lsp_signature.nvim',

  -- "gelguy/wilder.nvim";
  -- "creativenull/diagnosticls-nvim";
  -- "folke/lua-dev.nvim";
  -- "simrat39/symbols-outline.nvim";
  -- "glepnir/dashboard-nvim",
  -- "jiangmiao/auto-pairs", -- Consider removing (Slow!)
  'tweekmonster/startuptime.vim',
}
