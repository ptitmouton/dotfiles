local setup, null_ls = pcall(require, 'null-ls')
if not setup then
  return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup {
  sources = {
    diagnostics.stylelint,
    diagnostics.yamllint,
    formatting.jq,
    formatting.prettier,
    formatting.sql_formatter,
    formatting.stylua,
  },
  on_attach = function(current_client, bufnr)
    if current_client.supports_method('textDocument/formatting') then
      vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      vim.api.nvim_create_autocmd('BufWritePre', {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format {
            filter = function(client)
              -- only use null-ls for formatting instead of lsp server
              return client.name == 'null-ls'
            end,
            bufnr = bufnr,
          }
        end,
      })
    end
  end,
}
