return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        local configs = require("nvim-treesitter.configs")
        configs.setup({
            highlinght = { enable = true },
            indent = { enable = true },
            autotage = { enable = true },
            ensure_installed = {
                "lua",
                "ruby",
                "tsx",
                "typescript",
                "javascript",
                "css",
                "html",
                "rust",
            },
            auto_install = false,
        })
    end
}
