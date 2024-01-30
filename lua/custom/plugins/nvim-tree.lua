
-- following options are the default
-- each of these are documented in `:help nvim-tree.OPTION_NAME`
local config = {
    disable_netrw = true,
    hijack_netrw = true,
    hijack_cursor = true,
    sync_root_with_cwd = true,
    diagnostics = {
        enable = true,
    },
    update_focused_file = {
        enable = true,
        update_root = false,
        ignore_list = {}
    },
    on_attach = function(bufnr)
        local api = require('nvim-tree.api')

        local function opts(desc)
            return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
        end


        -- Mappings migrated from view.mappings.list
        --
        -- You will need to insert "your code goes here" for any mappings with a custom action_cb
        vim.keymap.set('n', 'l', api.node.open.edit, opts('Open'))
        vim.keymap.set('n', 'L', api.node.open.vertical, opts('Open: Vertical Split'))

        vim.keymap.set('n', 'h', api.node.navigate.parent_close, opts('Close Directory'))
        vim.keymap.set('n', 'H', api.tree.collapse_all, opts('Collapse'))
        vim.keymap.set('n', 't', api.tree.toggle_gitignore_filter, opts('Toggle Git Ignore'))

    end
}

return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
    "nvim-tree/nvim-web-devicons",
    },
    config = function()
        require('nvim-tree').setup(config)
        -- This just nvim quit properly if the tree is the last window open
        -- vim.cmd([[
        --     autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif
        -- ]])
    end
}
