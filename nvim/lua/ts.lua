local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Enable snippet support (Crucial: Auto-imports fail without this)
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- Setup TypeScript server (using vtsls)
lspconfig.vtsls.setup({
  capabilities = capabilities,
  settings = {
    typescript = {
      suggest = {
        autoImports = true, -- Enables auto-import suggestions
      },
    },
    javascript = {
      suggest = {
        autoImports = true,
      },
    },
  },
})
