-- return
---- Using Lazy
return {
  {
    "webhooked/kanso.nvim",
    lazy = false,
    priority = 1000,
    theme = "zen",
    config = function()
      -- Default options:
      require("kanso").setup({
        colors = { -- add/modify theme and palette colors
          palette = {
            zen0 = "#000000",
          },
        },
        background = { -- map the value of 'background' option to a theme
          dark = "zen", -- try "ink" !
          light = "pearl",
        },
      })
    end,
  },

  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      -- Default options:
      require("kanagawa").setup({
        colors = { -- add/modify theme and palette colors
          palette = {
            dragonBlack0 = "#000000",
            dragonBlack1 = "#000000",
            dragonBlack3 = "#000000",
            dragonBlack4 = "#000000",
          },
          theme = {
            all = {
              ui = {
                bg_gutter = "none",
              },
            },
          },
        },
        theme = "dragon", -- Load "kanagawa" theme when 'background' option is set to "dark"
        background = { -- map the value of 'background' option to a theme
          dark = "dragon", -- try "ink" !
          light = "lotus",
        },

        overrides = function(colors)
          local theme = colors.theme
          return {
            -- Blink-specific highlights
            BlinkCmpMenu = { bg = theme.ui.bg_m3 },
            BlinkCmpDoc = { bg = theme.ui.bg_m3 },
            BlinkCmpMenuBorder = { bg = "none" },
          }
        end,
      })
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "kanagawa",
    },
  },
}
