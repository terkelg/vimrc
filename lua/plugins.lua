local vim = vim

require "paq" {
    'savq/paq-nvim';                  -- Let Paq manage itself

    -- lib (dependencies)
    'nvim-lua/plenary.nvim';
    'nvim-lua/popup.nvim';
    'kyazdani42/nvim-web-devicons';

    {'kyazdani42/nvim-tree.lua', opt=true};

    "glepnir/lspsaga.nvim";
    "kabouzeid/nvim-lspinstall";
    "nvim-treesitter/nvim-treesitter";
    "hrsh7th/nvim-compe";
    "neovim/nvim-lspconfig";
    "hoob3rt/lualine.nvim"; -- TBD
    "nvim-telescope/telescope.nvim";

    "akinsho/nvim-bufferline.lua";

    "jiangmiao/auto-pairs";


    "glepnir/dashboard-nvim";

    "folke/tokyonight.nvim";
    "folke/which-key.nvim";
    "folke/trouble.nvim";
    "folke/todo-comments.nvim";
    { "folke/zen-mode.nvim", opt=true };
    { "folke/twilight.nvim", opt=true };

    "tpope/vim-commentary";
    "tpope/vim-surround";
    "tpope/vim-repeat";

    -- Git
    "kdheepak/lazygit.nvim";
    "lewis6991/gitsigns.nvim";

    "yuttie/comfortable-motion.vim"; -- TBD
    "mhartington/formatter.nvim";
    "ray-x/lsp_signature.nvim";

    -- "folke/twilight.nvim";
    -- "gelguy/wilder.nvim";
    -- "creativenull/diagnosticls-nvim";
    -- "folke/lua-dev.nvim";
    -- "simrat39/symbols-outline.nvim";
    "tweekmonster/startuptime.vim";
}
