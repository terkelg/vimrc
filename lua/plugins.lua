local vim = vim

require 'paq' {
  'savq/paq-nvim', -- Let Paq manage itself

  -- lib (dependencies)
  'nvim-lua/plenary.nvim',
  'nvim-lua/popup.nvim',
  'kyazdani42/nvim-web-devicons',

  { 'kyazdani42/nvim-tree.lua', opt = true },

  'glepnir/lspsaga.nvim',
  'kabouzeid/nvim-lspinstall',
  'nvim-treesitter/nvim-treesitter',
  'hrsh7th/nvim-compe',
  'neovim/nvim-lspconfig',
  'hoob3rt/lualine.nvim',

  'nvim-telescope/telescope.nvim',
  'ggandor/lightspeed.nvim',
  'akinsho/nvim-bufferline.lua',

  'folke/tokyonight.nvim',
  'folke/which-key.nvim',
  'folke/trouble.nvim',
  'folke/todo-comments.nvim',
  { 'folke/zen-mode.nvim', opt = true },
  { 'folke/twilight.nvim', opt = true },

  'terrortylor/nvim-comment',
  'tpope/vim-surround',

  -- Git
  { 'kdheepak/lazygit.nvim', opt = true },
  'lewis6991/gitsigns.nvim',

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
