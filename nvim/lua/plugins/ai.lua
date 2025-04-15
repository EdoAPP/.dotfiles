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
}
