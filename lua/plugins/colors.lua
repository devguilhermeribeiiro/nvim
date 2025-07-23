return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        lazy = false,

        config = function()
            require("catppuccin").setup({
                flavour = "macchiato",
                transparent_background = true,
            })
            vim.cmd.colorscheme "catppuccin"
        end
    },

    {
        -- Show CSS Colors
        'brenoprata10/nvim-highlight-colors',
        config = function()
            require('nvim-highlight-colors').setup({})
        end
    },
}
