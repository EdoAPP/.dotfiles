-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {

  -- NOTE: First, some plugins that don't require any configuration
  -- Git related plugins
  {
    'tpope/vim-fugitive',
    config = function()
      vim.keymap.set("n", "<leader>gs", vim.cmd.Git, { desc = "open [g]it [s]tatus" })
    end
  },
  -- TODO: github package that I Don't know how it works
  'tpope/vim-rhubarb',

  -- Detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',

  { 'mhartington/formatter.nvim' },
  -- NOTE: This is where your plugins related to LSP can be installed.
  --  The configuration is done below. Search for lspconfig to find it below.
  {
    -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    dependencies = {
      -- Automatically install LSPs to stdpath for neovim
      { 'williamboman/mason.nvim', config = true },
      'williamboman/mason-lspconfig.nvim',

      -- Useful status updates for LSP
      -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
      { 'j-hui/fidget.nvim',       opts = {} },

      -- Additional lua configuration, makes nvim stuff amazing!
      'folke/neodev.nvim',
    },
  },

  -- Useful plugin to show you pending keybinds.
  { 'folke/which-key.nvim',      opts = {} },
  {
    'sainnhe/everforest',
    priority = 1000,
    config = function()
      vim.cmd "let g:everforest_background = 'medium'";
      vim.cmd "colorscheme everforest";
    end
  },
  {
    -- Set lualine as statusline
    'nvim-lualine/lualine.nvim',
    -- See `:help lualine.txt`
    opts = {
      options = {
        icons_enabled = true,
        theme = 'auto',
        component_separators = '|',
        section_separators = '',
      },
    },
  },
  {
    -- Add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
    -- Enable `lukas-reineke/indent-blankline.nvim`
    -- See `:help ibl`
    main = 'ibl',
    opts = {},
  },

  -- "gc" to comment visual regions/lines
  { 'numToStr/Comment.nvim', opts = {} },
  {
    'mbbill/undotree',
    config = function()
      vim.keymap.set("n", "<leader>ut", vim.cmd.UndotreeToggle)
    end
  },
}
