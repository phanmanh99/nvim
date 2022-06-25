--[[

Neovim init file
Version: 0.62.0 - 2022/06/07
Maintainer: brainf+ck
Website: https://github.com/brainfucksec/neovim-lua

--]]

-- Import Lua modules
require('packer_init')
require('core/colors')
require('core/options')
require('core/keymaps')
require('plugins/tree')
require('plugins/alpha-nvim')
require('plugins/lualine')
require('plugins/blankline')
require('plugins/treesitter')
require('plugins/lspconfig')
require('plugins/autopairs')
require('plugins/telescope')
require('plugins/cmp')
