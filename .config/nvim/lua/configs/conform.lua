local options = {
  formatters_by_ft = {
    json = { "prettier" },
    lua = { "stylua" },
    nix = { "alejandra" },
    -- nu = {"nufmt"}, -- broken for now
    python = { "ruff_fix", "ruff_format", "ruff_organize_imports" },
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
