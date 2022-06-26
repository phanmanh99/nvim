local api = vim.api
local g = vim.g
local opt = vim.opt
local cmd = vim.cmd

-- mouse release = send selection to clipboard
-- nvim_set_keymap() help: see https://github.com/nanotee/nvim-lua-guide
local default_opts = { noremap = true, silent = true }
api.nvim_set_keymap("v", "<LeftRelease>", '"*ygv', default_opts)

opt.encoding = 'UTF-8'   -- Enable colors in terminal
opt.termguicolors = true   -- Enable colors in terminal
opt.hlsearch = true        -- Set highlight on search
opt.number = true          -- Make line numbers default
opt.mouse = "a"            -- Enable mouse mode
opt.breakindent = true     -- Enable break indent
opt.undofile = true        -- Save undo history
opt.ignorecase = true      -- Case insensitive searching unless /C or capital in search
opt.smartcase = true       -- Smart case
opt.updatetime = 250       -- Decrease update time
opt.signcolumn = "yes"     -- Always show sign column
-- opt.clipboard = "unnamedplus" -- Access system clipboard
opt.expandtab = true       -- use space instead of tab by default
opt.tabstop = 2            -- use space instead of tab by default
opt.softtabstop = 2        -- use space instead of tab by default
opt.shiftwidth = 2       -- use space instead of tab by default
opt.autoindent = true       -- use space instead of tab by default
opt.showmode = false       -- Do not need to show the mode. We use the statusline instead.
opt.showmatch = true       -- highlight matching brackets
opt.cursorline = true      -- show cursor line
opt.joinspaces = false     -- No double spaces with join after a dot
opt.list = true            -- show space and tabs chars
opt.listchars = "eol:⏎,tab:▸·,trail:×,nbsp:⎵"  -- make tab, etc visible
opt.spelllang = "en_us"
opt.sessionoptions = "buffers,curdir,folds,help,tabpages,winsize,winpos,terminal"
opt.completeopt = "menuone,noselect"

-- prefer `industry` color scheme
cmd [[
  set noswapfile
  syntax enable
  colorscheme dracula
]]
