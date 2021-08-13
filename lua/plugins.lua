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
    "folke/tokyonight.nvim";
    "hoob3rt/lualine.nvim"; -- TBD

    "nvim-telescope/telescope.nvim";

    "akinsho/nvim-bufferline.lua";

    "jiangmiao/auto-pairs";

    "folke/trouble.nvim";

    "glepnir/dashboard-nvim";

    "lewis6991/gitsigns.nvim";

    -- "simrat39/symbols-outline.nvim";
    "folke/which-key.nvim";
    "tpope/vim-commentary";
    "tpope/vim-surround";
    "tpope/vim-repeat";

    -- Git
    "kdheepak/lazygit.nvim";

    "yuttie/comfortable-motion.vim"; -- TBD
    "mhartington/formatter.nvim";
    -- "folke/twilight.nvim"; -- TBD
    -- "gelguy/wilder.nvim";
    { "folke/zen-mode.nvim", opt=true }; -- TBD (Same as toggle window?)
    "ray-x/lsp_signature.nvim";


    -- "creativenull/diagnosticls-nvim";
    -- {"folke/lua-dev.nvim", opt = true};
}
