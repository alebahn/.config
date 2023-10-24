local configs = require("plugins.configs.lspconfig")
local on_attach = configs.on_attach
local capabilities = configs.capabilities

local lspconfig = require "lspconfig"

local cc = os.getenv("CC")
local cmd = {"clangd"}
if (cc) then
  cmd = {
    "clangd",
    "--log=verbose",
    "--query-driver",
    "\"" .. os.getenv("CC") .. "\""
  }
end

lspconfig.clangd.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = cmd
}
