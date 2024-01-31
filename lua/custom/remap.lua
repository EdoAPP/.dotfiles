-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set("n", "<D-s>", vim.cmd.w);
vim.keymap.set("n", "<leader>q", vim.cmd.q);
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("n", "<D-b>", ":NvimTreeToggle<CR>", { silent = true, noremap = true });

-- Makes sure that the cursor stays in the middle when searching /
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- greatest remap ever - keeps the buffer of the previous word that was used to replace
vim.keymap.set("x", "<leader>p", [["_dP]])

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', 'gh', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', 'gH', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

vim.keymap.set("n", "<leader>sar", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
  { desc = '[S]earch [a]ll current file and [R]eplace' });

-- Buffer stuff
vim.keymap.set("n", "<leader>bd", ":bd<Enter>", { desc = "[B]uffer [D]elete"} );

-- Window management
vim.keymap.set("n", "<C-h>", "<C-w>h");
vim.keymap.set("n", "<C-l>", "<C-w>l");
vim.keymap.set("n", "<C-k>", "<C-w>k");
vim.keymap.set("n", "<C-j>", "<C-w>j");
