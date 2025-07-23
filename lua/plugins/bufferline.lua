return {
    "utilyre/barbecue.nvim",
    dependencies = {
        "SmiteshP/nvim-navic", -- Necessário para mostrar contexto
        "catppuccin/nvim", -- Para integração de cores
    },
    config = function()
        require("barbecue").setup({
            theme = "catppuccin", -- Usa o tema Catppuccin automaticamente
            show_modified = true, -- Mostra ícone se o arquivo foi modificado
        })
    end

}
