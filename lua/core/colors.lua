local g                       = vim.g
local cmd                     = vim.cmd
-- Example config in Lua
g.tokyonight_style            = "night"
g.tokyonight_italic_functions = true
g.tokyonight_sidebars         = { "qf", "vista_kind", "terminal", "packer" }

-- Change the "hint" color to the "orange" color, and make the "error" color bright red
g.tokyonight_colors = { hint = "orange", error = "#ff0000" }

-- Load the colorscheme
