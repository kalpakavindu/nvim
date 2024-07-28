require("kalpakavindu.settings")
require("kalpakavindu.lazy_init")
require("kalpakavindu.remap")

-- Set colortheme
vim.cmd.colorscheme("tokyonight")

-- Diagnostics on hover
vim.diagnostic.config({
  virtual_text=false, -- I don't want this
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = false,
})

vim.o.updatetime = 250
vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
  group = vim.api.nvim_create_augroup("float_diagnostic_cursor", { clear = true }),
  callback = function ()
    vim.diagnostic.open_float(nil, {focus=false, scope="cursor"})
  end
})
