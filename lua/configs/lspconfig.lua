require("nvchad.configs.lspconfig").defaults()

local on_attach = require("nvchad.configs.lspconfig").on_attach
local capabilities = require("nvchad.configs.lspconfig").capabilities
local lspconfig = require "lspconfig"
local home = os.getenv("HOME")
local util = require "lspconfig/util"
local workspace_dir = home .. "/.local/share/jdtls-workspace/" .. vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")

local servers = { "html", "cssls", "pyright" }

vim.lsp.enable(servers)

lspconfig.ts_ls.setup({})

lspconfig.html.setup {
  filetypes = { "html", "ts-react", "js-react"}
}

lspconfig.nim_langserver.setup {
  cmd = { "nimlangserver" },
  filetypes = { "nim" },
  on_attach = on_attach,
  capabilities = capabilities,
  root_dir = function()
    vim.fn.getcwd()
  end,
  settings = {
    nim = {
      nimsuggestPath = home .. "/.nimble/bin/nimsuggest"
    }
  }
}

-- Configuração do JDTLS
lspconfig.jdtls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { 
    vim.fn.expand("~/.local/share/nvim/mason/bin/jdtls"), 
    "-data", workspace_dir
  },
  filetypes = { "java" },
  root_dir = util.root_pattern('pom.xml', '.git'),
}
-- read :h vim.lsp.config for changing options of lsp servers 
