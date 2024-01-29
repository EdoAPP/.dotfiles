-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)

-- [[ Basic Keymaps ]]

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set("n", "<leader>b", vim.cmd.Ex);
vim.keymap.set("n", "<leader>w", vim.cmd.w);
vim.keymap.set("n", "<leader>q", vim.cmd.q);
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

vim.keymap.set("v", "J", '<Esc>ddpv');
vim.keymap.set("v", "K", '<Esc>ddkPv');

-- vim.keymap.set("v", "will have to think about this", 'Ypv');
-- vim.keymap.set("v", "same this ctrl + option + K", 'YPv');

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', 'gh', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', 'gH', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })
