local options = {
  formatters_by_ft = {
    go = { "gofmt" },
    json = { "prettier" },
    jsonc = { "prettier" },
    lua = { "stylua" },
    nix = { "alejandra" },
    -- nu = {"nufmt"}, -- broken for now
    python = { "ruff_fix", "ruff_format", "ruff_organize_imports" },
    rust = { "rustfmt" },
    toml = { "taplo" },
    typescript = { "prettier" },
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
