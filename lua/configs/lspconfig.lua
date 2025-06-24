require("nvchad.configs.lspconfig").defaults()

local on_attach = require("nvchad.configs.lspconfig").on_attach
local capabilities = require("nvchad.configs.lspconfig").capabilities
local lspconfig = require "lspconfig"
local util = require "lspconfig/util"
local home = os.getenv("HOME")
local workspace_dir = home .. "/.local/share/jdtls-workspace/" .. vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")


local servers = {
  "html", "cssls", "intelephense", 
  "pyright", "crystalline",
  "nimlangserver", "nginx-language-server"
}

vim.lsp.enable(servers)

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
