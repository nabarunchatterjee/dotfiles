-- [[ Basic Keymaps ]]

vim.keymap.set('n', '<C-t>', require('nvim-tree').open_on_directory, { silent = true })
-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Move to previous buffer
vim.keymap.set('n', '<', ":bp<CR>", { silent = true })
vim.keymap.set('n', '>', ":bn<CR>", { silent = true })

-- Open Nvim Tree keymap
vim.keymap.set('n', '<esc>t', ":NvimTreeToggle<CR>", { silent = true })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })
vim.keymap.set('n', 'gx', "execute '!open ' . shellescape(expand('<cfile>'), 1)<CR>", { noremap = true })


-- See `:help telescope.builtin`
local tb = require('telescope.builtin')
vim.keymap.set('n', '<leader>?', tb.oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader><space>', tb.buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  tb.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer' })

vim.keymap.set('n', '<leader>gf', tb.git_files, { desc = 'Search [G]it [F]iles' })
vim.keymap.set('n', '<leader>sf', tb.find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sh', tb.help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', tb.grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', tb.live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sd', tb.diagnostics, { desc = '[S]earch [D]iagnostics' })

-- Luasnip
local ls = require("luasnip")
vim.keymap.set({ "i" }, "<C-K>", function() ls.expand() end, { silent = true })
vim.keymap.set({ "i", "s" }, "<C-L>", function() ls.jump(1) end, { silent = true })
vim.keymap.set({ "i", "s" }, "<C-J>", function() ls.jump(-1) end, { silent = true })

-- vim.keymap.set({ "i", "s" }, "<C-E>", function()
--   if ls.choice_active() then
--     ls.change_choice(1)
--   end
-- end, { silent = true })
