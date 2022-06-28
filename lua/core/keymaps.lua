-----------------------------------------------------------
-- Define keymaps of Neovim and installed plugins.
-----------------------------------------------------------

local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Change leader to a comma
vim.g.mapleader = ','

-----------------------------------------------------------
-- Neovim shortcuts
-----------------------------------------------------------

-- Disable arrow keys
map('', '<up>', '<nop>')
map('', '<down>', '<nop>')
map('', '<left>', '<nop>')
map('', '<right>', '<nop>')

-- Map Esc to kk
-- map('i', 'kk', '<Esc>')

-- Clear search highlighting with <leader> and c
map('n', '<leader>c', ':nohl<CR>')

-- Change split orientation
map('n', '<leader>tk', '<C-w>t<C-w>K') -- change vertical to horizontal
map('n', '<leader>th', '<C-w>t<C-w>H') -- change horizontal to vertical

-- Move around splits using Ctrl + {h,j,k,l}
map('n', '<C-h>', '<C-w>h')
map('n', '<C-j>', '<C-w>j')
map('n', '<C-k>', '<C-w>k')
map('n', '<C-l>', '<C-w>l')

-- Reload configuration without restart nvim
map('n', '<leader>r', ':so %<CR>')

-- Close all windows and exit from Neovim with <leader> and q
map('n', '<leader>q', ':qa!<CR>')

--Terminal
map('n', '<C-t>', ':terminal<CR>')
map('t', '<ESC>', '<C-\\><C-n>', {noremap = true})
-----------------------------------------------------------
-- Applications and Plugins shortcuts
-----------------------------------------------------------

-- NvimTree
map('n', '<C-n>', ':NvimTreeToggle<CR>')        -- open/close
map('n', '<leader>m', ':NvimTreeFindFile<CR>')      -- search file

-- Telescope
map('n', '<C-p>', "<cmd>lua require('telescope.builtin').find_files()<cr>")
map('n', '<leader>ff', "<cmd>lua require('telescope.builtin').find_files()<CR>")
map('n', '<leader>fg', "<cmd>lua require('telescope.builtin').live_grep()<CR>")
map('n', '<leader>fb', "<cmd>lua require('telescope.builtin').buffers()<CR>")
map('n', '<leader>fh', "<cmd>lua require('telescope.builtin').help_tags()<CR>")

-- Tag viewer
map('', '<leader>n', ':TagbarToggle<CR>')
