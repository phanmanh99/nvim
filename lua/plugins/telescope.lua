local status_ok, _ = pcall(require, 'telescope')
if not status_ok then
  return
end

require('telescope').setup {
  defaults = {
    -- Default configuration for telescope goes here:
    -- config_key = value,
    mappings = {
      i = {
        -- map actions.which_key to <C-h> (default: <C-/>)
        -- actions.which_key shows the mappings for your picker,
        -- e.g. git_{create, delete, ...}_branch for the git_branches picker
        ["<C-h>"] = "which_key"
      }
    }
  },
  pickers = {
    -- Default configuration for builtin pickers goes here:
    -- picker_name = {
    --   picker_config_key = value,
    --   ...
    -- }
    -- Now the picker_config_key will be applied every time you call this
    -- builtin picker
  },
  extensions = {
    -- Your extension configuration goes here:
    -- extension_name = {
    --   extension_config_key = value,
    -- }
    -- please take a look at the readme of the extension you want to configure
  }
}

local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Telescope
map('n', '<C-p>', "<cmd>lua require('telescope.builtin').find_files()<cr>")
map('n', '<leader>ff', "<cmd>lua require('telescope.builtin').find_files()<CR>")
map('n', '<leader>fg', "<cmd>lua require('telescope.builtin').live_grep()<CR>")
map('n', '<leader>fb', "<cmd>lua require('telescope.builtin').buffers()<CR>")
map('n', '<leader>fh', "<cmd>lua require('telescope.builtin').help_tags()<CR>")
map('n', '<leader>gcm', "<cmd>lua require('telescope.builtin').git_commits()<CR>")
map('n', '<leader>gbr', "<cmd>lua require('telescope.builtin').git_branches()<CR>")
map('n', '<leader>gst', "<cmd>lua require('telescope.builtin').git_status()<CR>")
