require("kalpakavindu.settings")
require("kalpakavindu.lazy_init")
require("kalpakavindu.remap")

-- initialize plugins
require("kalpakavindu.config.icons")
require("kalpakavindu.config.telescope")
require("kalpakavindu.config.treesitter")
require("kalpakavindu.config.lsp")
require("kalpakavindu.config.snippets")
require("kalpakavindu.config.formatting")
require("kalpakavindu.config.gopher")
require("kalpakavindu.config.comment")
require("kalpakavindu.config.lualine")
require("kalpakavindu.config.gitsigns")
require("kalpakavindu.config.tokyonight")

-- Set colortheme
vim.cmd.colorscheme("tokyonight")

local MY_GRP = vim.api.nvim_create_augroup("__kalpakavindu__", { clear = true })
local autocmd = vim.api.nvim_create_autocmd

-- Diagnostics on hover
vim.o.updatetime = 250
autocmd({ "CursorHold", "CursorHoldI" }, {
	group = MY_GRP,
	callback = function()
		vim.diagnostic.open_float(nil, { focus = false, scope = "cursor" })
	end,
})

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
