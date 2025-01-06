require "nvchad.options"

local o = vim.o
o.clipboard = "";

local function is_wsl()
  local version_file = io.open("/proc/version", "rb")
  if version_file ~= nil and string.find(version_file:read "*a", "microsoft") then
    version_file:close()
    return true
  end
  return false
end

if is_wsl() then
  vim.g.clipboard = {
    name = "WslClipboard",
    copy = {
      ["+"] = "clip.exe",
      ["*"] = "clip.exe",
    },
    paste = {
      ["+"] = 'pwsh.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
      ["*"] = 'pwsh.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
    },
    cache_enabled = 0,
  }
end

o.nu = true
o.relativenumber = true

o.tabstop = 2
o.softtabstop = 2
o.shiftwidth = 2
o.expandtab = true
o.smartindent = true

o.wrap = false

o.hlsearch = false
o.incsearch = true

o.scrolloff = 8
o.signcolumn = "yes"

o.updatetime = 50

o.colorcolumn = "80"
