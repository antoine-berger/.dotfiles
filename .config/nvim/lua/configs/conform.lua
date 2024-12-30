local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    nix = { "nixfmt" },
    -- nu = {"nufmt"}, -- broken for now
    python = { "isort", "black" },
    go = { "gofmt" },
    rust = { "rustfmt" },
    yaml = { "yamlfmt" },
    zig = { "zigfmt" },
  },

  -- format_on_save = {
  --   -- These options will be passed to conform.format()
  --   timeout_ms = 500,
  --   lsp_fallback = true,
  -- },
}

return options
