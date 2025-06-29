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

vim.api.nvim_set_keymap('n', '<space>r', ':lua vim.diagnostic.setloclist()<CR>', { noremap = true, silent = true })
-- Normal mode keymap for formatting using <leader>l
vim.api.nvim_set_keymap('n', '<leader>l', [[<Cmd>lua require("conform").format({async = true})<CR>]], { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "<leader>cc", ":CopilotChat<CR>", {noremap=true, silent = true, desc = "Open Copilot Chat" })


vim.api.nvim_set_keymap("n", "<leader>ci", ":CopilotChat Insert<CR>", {noremap=true, silent = true, desc = "Insert Copilot Chat response" })
vim.api.nvim_set_keymap("n", "<leader>gc", ":Telescope git_commits<CR>", {noremap=true, silent = true, desc = "Search git commits" })
vim.api.nvim_set_keymap("n", "<leader>gb", ":Telescope git_bcommits<CR>", {noremap=true, silent = true, desc = "Search git commits for this file" })
-- Toggle git-ignored files in NvimTree
vim.api.nvim_set_keymap('n', '<leader>ti', ':lua require("nvim-tree").toggle_gitignore()<CR>', { noremap = true, silent = true })
