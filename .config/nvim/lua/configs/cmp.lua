return function(_, opts)
  local cmp = require "cmp"
  opts.mapping["<C-y>"] = opts.mapping["<CR>"]
  opts.mapping["<C-n>"] = opts.mapping["<Tab>"]
  opts.mapping["<C-p>"] = opts.mapping["<S-Tab>"]
  opts.mapping["<CR>"] = nil
  opts.mapping["<Tab>"] = nil
  opts.mapping["<S-Tab>"] = nil

  cmp.setup(opts)
end
