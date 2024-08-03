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

-- Lsp Key mappings
autocmd("LspAttach", {
	group = MY_GRP,
	callback = function(ev)
		vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

		local opts = { buffer = ev.buf }
		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
		vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
		vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts)
		vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts)
		vim.keymap.set("n", "<leader>wl", function()
			print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		end, opts)

		vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, opts)
		vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
		vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
		vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
	end,
})

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
