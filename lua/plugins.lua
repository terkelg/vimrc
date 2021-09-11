local vim = vim

-- Auto install paq if needed be
local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/paqs/start/paq-nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', '--depth=1', 'https://github.com/savq/paq-nvim.git', install_path})
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
  'kabouzeid/nvim-lspinstall',
  'nvim-treesitter/nvim-treesitter',
  'neovim/nvim-lspconfig',

  -- Show function signature
  'ray-x/lsp_signature.nvim',

  -- A nice status line
  'hoob3rt/lualine.nvim',

  -- Fuzzy find everything
  'nvim-telescope/telescope.nvim',
  {'nvim-telescope/telescope-fzf-native.nvim', run='make'},

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

  -- Easy block commenting
  'terrortylor/nvim-comment',

  -- Faste quoting/parenthesizing
  'tpope/vim-surround',

  'akinsho/toggleterm.nvim',

  -- Git
  { 'kdheepak/lazygit.nvim', opt = true },

  -- Gutter Git symbols
  'lewis6991/gitsigns.nvim',

  -- Smooth scrolling
  'yuttie/comfortable-motion.vim', -- Consider removing

  'mhartington/formatter.nvim',

  -- Fast completion
  { 'ms-jpq/coq_nvim', branch = 'coq' },

  -- Language Specific
  'evanleck/vim-svelte',

  -- "gelguy/wilder.nvim";
  -- "creativenull/diagnosticls-nvim";
  -- "folke/lua-dev.nvim";
  -- "simrat39/symbols-outline.nvim";
  -- "glepnir/dashboard-nvim",
  -- "jiangmiao/auto-pairs", -- Consider removing (Slow!)
  'tweekmonster/startuptime.vim',
}
