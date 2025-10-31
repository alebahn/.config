local configs = require("plugins.configs.lspconfig")
-- local configs = vim.lsp.config()
local on_attach = configs.on_attach
local capabilities = configs.capabilities

-- local lspconfig = vim.lsp.config()

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

vim.lsp.config("clangd", {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = cmd,
  filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "hpp" },
})

vim.lsp.config("rust_analyzer", {
  on_attach=on_attach,
  settings = {
    ["rust-analyzer"] = { cargo = { features = { "client", "server" } }, }
  }
})

vim.lsp.config("pyright", {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {"python"}
})

vim.lsp.config("ruff", {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {"python"}
})

vim.lsp.config("buf", {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "proto" },
  cmd = { "buf", "ls-lsp" },
})
