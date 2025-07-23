return {
    'akinsho/toggleterm.nvim',
    version = "*",
    opts = {
        -- Default configuration (you can override any of these)
        size = 20,
        open_mapping = [[<M-i>]],
        direction = 'float',
        shade_terminals = true,
        persist_size = true,
        close_on_exit = true,
        float_opts = {
            border = "curved"
        },
    },
    config = function(_, opts)
        require("toggleterm").setup(opts)
    end
}
