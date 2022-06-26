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
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  -- Treesitter interface
  use 'nvim-treesitter/nvim-treesitter'

  -- NeovimTree - A File Explorer For Neovim Written In Lua
  use 'kyazdani42/nvim-web-devicons' -- optional, for file icons
  use 'kyazdani42/nvim-tree.lua'

  -- BlankLine
  use "lukas-reineke/indent-blankline.nvim"

  -- LSP
  use {
    'williamboman/nvim-lsp-installer',
    'neovim/nvim-lspconfig',
    config = lua_path('lspconfig')
  }-- Configurations for Nvim LSP
  use {
    "ray-x/lsp_signature.nvim",
    config = lua_path('signature')
  }

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
    },
  }

  -- AutoPairs
  use 'windwp/nvim-autopairs'

  -- Twig
  use 'nelsyeung/twig.vim'

  -- Dashboard
  use {
    'goolord/alpha-nvim',
    config = lua_path('alpha-nvim')
  }

  -- Telescope
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} },
    config = lua_path('telescope')
  }

  --Git
  use {
  'lewis6991/gitsigns.nvim',
  config = lua_path('gitsigns')
}

  --Syntax

  --Tag viewer
  use 'preservim/tagbar'

  -- Theme dracula
  use {
    'Mofiqul/dracula.nvim'
  }
  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
