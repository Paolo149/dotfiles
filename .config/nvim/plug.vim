" ____  _             _
"|  _ \| |_   _  __ _(_)_ __  ___
"| |_) | | | | |/ _` | | '_ \/ __|
"|  __/| | |_| | (_| | | | | \__ \
"|_|   |_|\__,_|\__, |_|_| |_|___/
"               |___/

if has("nvim")
  let g:plug_home = stdpath('data') . '/plugged'
endif

call plug#begin()
Plug 'tami5/lspsaga.nvim',
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'nvim-lualine/lualine.nvim'
"Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'morhetz/gruvbox'
Plug 'lervag/vimtex'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'alvan/vim-closetag'
Plug 'tpope/vim-surround'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'mattn/emmet-vim'
Plug 'nvim-lua/completion-nvim'
Plug 'kristijanhusak/defx-git'
Plug 'kristijanhusak/defx-icons'
Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'neovim/nvim-lspconfig'
Plug 'folke/lsp-colors.nvim'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/nvim-cmp'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'onsails/lspkind-nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'windwp/nvim-autopairs'
Plug 'L3MON4D3/LuaSnip'
Plug 'nvim-treesitter/nvim-treesitter', { 'do': 'TSUpdate' }
Plug 'groenewege/vim-less', { 'for': 'less' }
Plug 'kchmck/vim-coffee-script', { 'for': 'coffee' }

call plug#end()
