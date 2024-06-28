local scope_color = {
    "scope_color",
}

local indent_color = {
    "indent_color",
}

local hooks = require "ibl.hooks"

hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
    vim.api.nvim_set_hl(0, "scope_color", { fg = "#7A8478" })
    vim.api.nvim_set_hl(0, "indent_color", { fg = "#505555" })
end)

require("ibl").setup {
    scope = {
        highlight = scope_color,
        enabled = false,
        show_start = false,
        show_end = false,
    },
    indent = {
        highlight = indent_color,
        char = "▏"
    },
}

hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)

