-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldmethod = "expr"

vim.opt.scrolloff = 8
vim.opt.ls = 0

-- •	⁠shortmess controls how messages are displayed. The options added above do the following:
-- •	⁠F: Don't show the "found" message when searching for a file.
-- •	⁠I: Don't show the intro message when starting Neovim.
-- •	⁠W: Don't show the "written" message when saving a file.
-- •	⁠c: Suppresses the "changed" message when a file is modified.
-- •	⁠s: Suppresses the "status" messages.
vim.opt.shortmess:append("F")
vim.opt.shortmess:append("I")
vim.opt.shortmess:append("W")
vim.opt.shortmess:append("c")
vim.opt.shortmess:append("s")
vim.opt.showmode = false -- Don't show mode in the status line
vim.opt.showcmd = false -- Don't show command in the status line
