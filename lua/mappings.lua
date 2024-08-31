require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

vim.keymap.set('n', '<C-s>', ':w<CR>', { noremap = true, silent = true })
map("i", "jk", "<ESC>")
map("n","<C-d>","<C-d>zz")
map("n","<C-u>","<C-u>zz")

-- Hover
vim.api.nvim_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', { noremap = true, silent = true })

-- Jump to definition
vim.api.nvim_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', { noremap = true, silent = true })

-- Open code actions
vim.api.nvim_set_keymap('n', '<leader>ca', '<Cmd>lua vim.lsp.buf.code_action()<CR>', { noremap = true, silent = true })

-- Open code actions for the selected visual range
vim.api.nvim_set_keymap('x', '<leader>ca', '<Cmd>lua vim.lsp.buf.range_code_action()<CR>', { noremap = true, silent = true })


