return {
  {
    "zbirenbaum/copilot.lua",
    opts = {
      suggestion = { enabled = true, auto_trigger = true, keymap = { accept = "<C-a>" } },
      panel = {
        enabled = true,
        auto_refresh = false,
        keymap = {
          jump_prev = "[[",
          jump_next = "]]",
          accept = "<CR>",
          refresh = "gr",
          open = "<M-CR>",
        },
        layout = {
          position = "bottom", -- | top | left | right
          ratio = 0.4,
        },
      },
      filetypes = {
        markdown = true,
        help = true,
      },
    },
  },
  {
    "saghen/blink.cmp",
    opts = function(_, opts)
      -- Remove 'copilot' from default source list
      opts.sources.default = vim.tbl_filter(function(name)
        return name ~= "copilot"
      end, opts.sources.default or {})

      return opts
    end,
  },
  -- {
  --   "olimorris/codecompanion.nvim",
  --   -- Specify dependencies. plenary is crucial.
  --   dependencies = {
  --     "nvim-lua/plenary.nvim",
  --     "nvim-treesitter/nvim-treesitter",
  --     "MeanderingProgrammer/render-markdown.nvim",
  --   },
  --   build = ":TSInstall markdown markdown_inline",
  --   opts = {
  --     adapters = {
  --       adapters = {
  --         gemini = function()
  --           return require("codecompanion.adapters").extend("gemini", {
  --             schema = {
  --               model = {
  --                 default = "gemini-2.5-pro",
  --               },
  --             },
  --           })
  --         end,
  --       },
  --     },
  --
  --     inline_assist = {
  --       -- Ensure Gemini is used for inline assist unless overridden
  --       default_options = {
  --         strategy = "gemini",
  --       },
  --     },
  --
  --     -- Configuration for chat display and behavior
  --     chat = {
  --       display = {
  --         window = {
  --           border = "rounded", -- Style of the chat window border
  --         },
  --       },
  --     },
  --   },
  --   -- Set up keybindings ⌨️
  --   keys = {
  --     {
  --       "<leader>aa",
  --       "<cmd>CodeCompanionChat<cr>",
  --       desc = "CodeCompanion: Toggle Chat 💬",
  --       mode = { "n", "v" }, -- Normal and Visual modes
  --     },
  --     {
  --       "<leader>ac",
  --       "<cmd>CodeCompanionActions<cr>",
  --       desc = "CodeCompanion: Actions 🛠️",
  --       mode = { "n", "v" }, -- Normal and Visual modes
  --     },
  --     {
  --       "<leader>ai",
  --       "<cmd>CodeCompanionInlineAssist<cr>",
  --       desc = "CodeCompanion: Inline Assist ✨",
  --       mode = { "v" }, -- Primarily in Visual mode for selections
  --     },
  --     {
  --       "<leader>ai",
  --       "<cmd>CodeCompanionInlineAssist<cr>",
  --       desc = "CodeCompanion: Inline Assist ✨",
  --       mode = { "n" }, -- Also available in Normal mode
  --     },
  --   },
  --   -- The config function ensures setup is called after loading
  --   config = function(_, opts)
  --     require("codecompanion").setup(opts)
  --   end,
  -- },
  --
  -- -- Ensure render-markdown.nvim is configured (this is important)
  -- {
  --   "MeanderingProgrammer/render-markdown.nvim",
  --   -- Load it for markdown and codecompanion filetypes
  --   ft = { "markdown", "codecompanion" },
  --   opts = {},
  --   -- Optional: Explicitly configure it to use Treesitter parsers
  --   config = function()
  --     pcall(function()
  --       require("render-markdown").setup({
  --         filetypes = { "markdown", "codecompanion" },
  --       })
  --     end)
  --   end,
  -- },
}
