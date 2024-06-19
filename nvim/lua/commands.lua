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
