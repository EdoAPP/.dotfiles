--
-- [[ Setting options ]]
-- See `:help vim.o`
-- NOTE: You can change these options as you wish!

-- Set <space> as the leader key
--
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)

-- [[ Basic Keymaps ]]

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- required so that nvim-tree is more performant
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- NOTE: You should make sure your terminal supports this
-- optionally enable 24-bit colour
vim.opt.termguicolors = true

-- Set highlight on search
vim.o.hlsearch = false

vim.o.incsearch = true

-- Make line numbers default
vim.wo.number = true

-- Make lines relative default
vim.wo.relativenumber = true

-- Enable mouse mode
vim.o.mouse = 'a'

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.o.clipboard = 'unnamedplus'

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.wo.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 25
vim.o.timeoutlen = 300

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

vim.opt.scrolloff = 8
