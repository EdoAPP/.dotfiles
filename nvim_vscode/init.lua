
local vscode = require('vscode-neovim')
-- moves the current line to up and down
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")

-- greatest remap ever - keeps the buffer of the previous word that was used to replace
vim.keymap.set("x", "<leader>p", [["_dP]])

vim.keymap.set("n", "<leader>sar", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
  { desc = '[S]earch [a]ll current file and [R]eplace' });

local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- Window management
-- vim.keymap.set("n", "<C-h>", "<C-w>h");
-- vim.keymap.set("n", "<C-l>", "<C-w>l");
-- vim.keymap.set("n", "<C-k>", "<C-w>k");
-- vim.keymap.set("n", "<C-j>", "<C-w>j");

-- buffer stuff
vim.keymap.set("n", "<S-h>", ":bprevious<Enter>")
vim.keymap.set("n", "<S-l>", ":bnext<Enter>")