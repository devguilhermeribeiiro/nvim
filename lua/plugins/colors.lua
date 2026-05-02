return {
  {
    "sainnhe/gruvbox-material",
    lazy = false,
    priority = 1000,
    config = function()
      vim.g.gruvbox_material_enable_italic = true
      vim.g.gruvbox_material_transparent_background = 1
      vim.g.gruvbox_material_background = "hard"

      vim.cmd.colorscheme("gruvbox-material")

      local function transparent()
	local groups = {
	  "Normal",
	  "NormalFloat",
	  "FloatBorder",
	  "SignColumn",
	  "StatusLine",
	  "StatusLineNC",
	  "EndOfBuffer",
	  "LineNr",
	  "CursorLineNr",
	  "FoldColumn",
	  "Pmenu",
	  "PmenuSel",
	  "TelescopeNormal",
	  "TelescopeBorder",
	  "VertSplit",
	  "WinSeparator",
	}

	for _, group in ipairs(groups) do
	  vim.api.nvim_set_hl(0, group, { bg = "none" })
	end
      end

      transparent()

      -- garante que continue transparente ao trocar tema
      vim.api.nvim_create_autocmd("ColorScheme", {
	callback = function()
	  transparent()
	end,
      })
    end,
  },

  {
    -- Show CSS Colors
    'brenoprata10/nvim-highlight-colors',
    config = function()
	require('nvim-highlight-colors').setup({})
    end
  },
}
