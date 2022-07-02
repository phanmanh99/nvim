local status_ok, null_ls = pcall(require, 'null-ls')
if not status_ok then
  return
end

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup({
  -- you can reuse a shared lspconfig on_attach callback here
  -- on_attach = function(client, bufnr)
  --   if client.supports_method("textDocument/formatting") then
  --     vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
  --     vim.api.nvim_create_autocmd("BufWritePre", {
  --       group = augroup,
  --       buffer = bufnr,
  --       callback = function()
  --         -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
  --         vim.lsp.buf.formatting_sync()
  --       end,
  --     })
  --   end
  -- end,
  sources = {
    null_ls.builtins.code_actions.gitsigns,
    null_ls.builtins.code_actions.gitrebase,
    null_ls.builtins.code_actions.refactoring,
    null_ls.builtins.code_actions.eslint,
    null_ls.builtins.completion.luasnip,
    null_ls.builtins.completion.spell,
    null_ls.builtins.completion.tags,
    -- null_ls.builtins.completion.vsnip,
    null_ls.builtins.diagnostics.eslint,
    -- null_ls.builtins.formatting.eslint,
    -- null_ls.builtins.formatting.erb_lint,
    -- null_ls.builtins.formatting.prettier,
    -- null_ls.builtins.formatting.phpcbf,
  }
})

vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.formatting_sync()]]
