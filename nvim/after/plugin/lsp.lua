local lsp_zero = require('lsp-zero')

lsp_zero.preset('recommended')

lsp_zero.on_attach(function(client, bufnr)
  lsp_zero.default_keymaps({buffer = bufnr})
end)

require('mason').setup({})
require('mason-lspconfig').setup({
  -- Replace the language servers listed here
  -- with the ones you want to install
  ensure_installed = {
      'clangd',
      'pylsp',
      'tsserver',
      'rust_analyzer',
      'lua_ls',
  },
  handlers = {
    lsp_zero.default_setup,
  }
})

lsp_zero.setup()
