vim.cmd [[colorscheme solarized]]
vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format()]]
vim.cmd [[autocmd BufWritePre *.go lua vim.lsp.buf.code_action({ source = { organizeImports = true } })]]
vim.cmd [[autocmd FileType python,sh,markdown,vim  setlocal colorcolumn=80]]
vim.cmd [[autocmd FileType go setlocal tabstop=4 shiftwidth=4 colorcolumn=120]]
vim.cmd [[autocmd FileType javascript,javascriptreact,typescript,typescriptreact,lua  setlocal shiftwidth=2 tabstop=2 colorcolumn=80]]
vim.cmd [[autocmd VimEnter * set background=dark]]

vim.api.nvim_create_autocmd({ "BufWinLeave" }, {
  pattern = { "*.*" },
  desc = "save view (folds), when closing file",
  command = "mkview",
})
vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
  pattern = { "*.*" },
  desc = "load view (folds), when opening file",
  command = "silent! loadview"
})

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.py",
  callback = function()
    -- Format the current buffer using the active LSP (e.g., Ruff)
    vim.lsp.buf.format({ async = false })
  end,
})

-- vim.api.nvim_create_autocmd("LspAttach", {
--   callback = function(args)
--     local client = vim.lsp.get_client_by_id(args.data.client_id)
--     if not client then return end
--
--     -- Mute Ruff so it never collides with Pyright's auto-import menus
--     if client.name == "ruff" then
--       client.server_capabilities.completionProvider = nil
--       client.server_capabilities.hoverProvider = nil
--     end
--
--     -- Explicitly tell Pyright to announce its formatting capability fallback
--     if client.name == "pyright" then
--       client.server_capabilities.documentFormattingProvider = false
--     end
--   end,
-- })
