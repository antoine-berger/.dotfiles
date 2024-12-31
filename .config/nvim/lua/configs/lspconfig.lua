-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

local configs = require "nvchad.configs.lspconfig"
local servers = {
  gopls = {},
  nil_ls = {},
  pyright = {
    settings = {
      python = {
        analysis = {
          autoSearchPaths = true,
          typeCheckingMode = "basic",
        },
      },
    },
  },
  rust_analyzer = {},
  ts_ls = {},
  zls = {},
}

local function on_attach(client, bufnr)
  configs.on_attach(client, bufnr)
end

for name, opts in pairs(servers) do
  opts.on_init = configs.on_init
  opts.on_attach = on_attach
  opts.capabilities = configs.capabilities

  lspconfig[name].setup(opts)
end
