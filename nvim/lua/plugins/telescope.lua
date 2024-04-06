return {
  "nvim-telescope/telescope.nvim",
  -- opts will be merged with the parent spec
  opts = {
    defaults = {
      file_ignore_patterns = { ".git/", "node_modules", ".yarn/" },
    },
  },
  keys = {
    { "<leader><space>", require("telescope.builtin").find_files, desc = "Find Files (Root Dir)" },
  },
}
