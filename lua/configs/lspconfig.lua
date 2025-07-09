require("nvchad.configs.lspconfig").defaults()

local on_attach = require("nvchad.configs.lspconfig").on_attach
local capabilities = require("nvchad.configs.lspconfig").capabilities
local lspconfig = require "lspconfig"
local util = require "lspconfig/util"
local home = os.getenv("HOME")
local workspace_dir = home .. "/.local/share/jdtls-workspace/" .. vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")


local servers = {
  "html", "cssls", "intelephense", 
  "pyright"
}

vim.lsp.enable(servers)

lspconfig.nim_langserver.setup {
  cmd = { "nimlangserver" },
  filetypes = { "nim" },
  on_attach = on_attach,
  capabilities = capabilities,
  root_dir = function(fname)
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

