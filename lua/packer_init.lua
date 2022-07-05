-----------------------------------------------------------
-- Plugin manager configuration file
-----------------------------------------------------------

-- Plugin manager: packer.nvim
-- url: https://github.com/wbthomason/packer.nvim

-- For information about installed plugins see the README:
-- neovim-lua/README.md
-- https://github.com/brainfucksec/neovim-lua#readme

-- Automatically install packer
local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({
    'git',
    'clone',
    '--depth',
    '1',
    'https://github.com/wbthomason/packer.nvim',
    install_path
  })
end

-- Autocommand that reloads neovim whenever you save the packer_init.lua file
vim.cmd [[
augroup packer_user_config
autocmd!
autocmd BufWritePost packer_init.lua source <afile> | PackerSync
augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, 'packer')
if not status_ok then
  return
end

-- Install plugins
return packer.startup(function(use)
  -- Load lua path
  local lua_path = function(name)
    return string.format("require'plugins.%s'", name)
  end

  -- Add you plugins here:
  use 'wbthomason/packer.nvim' -- packer can manage itself

  -- lualine
  use { 'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    config = lua_path('lualine'), }

  -- Treesitter interface
  use { 'nvim-treesitter/nvim-treesitter', config = lua_path('treesitter') }

  -- NeovimTree - A File Explorer For Neovim Written In Lua
  use 'kyazdani42/nvim-web-devicons' -- optional, for file icons
  use { 'kyazdani42/nvim-tree.lua', config = lua_path('tree'), }

  -- BlankLine
  use { "lukas-reineke/indent-blankline.nvim", config = lua_path('blankline'), }

  -- LSP
  use { 'williamboman/nvim-lsp-installer', config = lua_path('LSP/lsp-installer'), }
  use { 'neovim/nvim-lspconfig', config = lua_path('LSP/lspconfig') }
  use { "ray-x/lsp_signature.nvim", config = lua_path('LSP/signature') }
  use { 'tamago324/nlsp-settings.nvim' }
  use { 'jose-elias-alvarez/null-ls.nvim', config = lua_path('LSP/null-ls'), }

  -- Autocomplete
  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'L3MON4D3/LuaSnip',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-buffer',
      'saadparwaiz1/cmp_luasnip',
      'petertriho/cmp-git',
      'hrsh7th/cmp-cmdline'
    },
    config = lua_path('cmp'),
  }

  -- AutoPairs
  use { 'windwp/nvim-autopairs', config = lua_path('autopairs'), }

  -- Comment
  use { 'numToStr/Comment.nvim', config = function() require('Comment').setup() end, }

  -- Telescope
  use { 'nvim-telescope/telescope.nvim', requires = { { 'nvim-lua/plenary.nvim' } }, config = lua_path('telescope') }

  --Git
  use { 'lewis6991/gitsigns.nvim', config = lua_path('gitsigns') }
  use { 'kdheepak/lazygit.nvim' }

  -- Twig
  use 'nelsyeung/twig.vim'

  -- Dashboard
  use { 'goolord/alpha-nvim', config = lua_path('alpha-nvim'), }

  -- Syntax

  -- Tab bar
  use { 'romgrk/barbar.nvim', requires = { 'kyazdani42/nvim-web-devicons' }, config = lua_path('bartab'), }

  --Scroll bar
  use { 'Xuyuanp/scrollbar.nvim', config = lua_path('scrollbar') }

  -- Tag viewer
  use 'preservim/tagbar'

  -- Theme
  use { 'Mofiqul/dracula.nvim' }
  use { 'matsuuu/pinkmare' }
  use { 'folke/tokyonight.nvim', }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
