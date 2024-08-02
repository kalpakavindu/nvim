local cmp = require("cmp")
local cmp_lsp = require("cmp_nvim_lsp")
local capabilities =
	vim.tbl_deep_extend("force", {}, vim.lsp.protocol.make_client_capabilities(), cmp_lsp.default_capabilities())

require("fidget").setup({})

require("mason").setup({
	providers = {
		"mason.providers.client",
		"mason.providers.registry-api",
	},
})

require("mason-lspconfig").setup({
	ensure_installed = { "lua_ls", "clangd", "gopls", "cmake", "tsserver", "typos_lsp" },
	handlers = {
		-- default handler
		function(server_name)
			require("lspconfig")[server_name].setup({
				capabilities = capabilities,
			})
		end,

		["tsserver"] = function()
			local lspconfig = require("lspconfig")
			lspconfig.tsserver.setup({
				capabilities = capabilities,
				filetypes = {
					"javascript",
					"javascriptreact",
					"javascript.jsx",
					"typescript",
					"typescriptreact",
					"typescript.tsx",
				},
				root_dir = lspconfig.util.root_pattern("tsconfig.json", "jsconfig.json", "package.json", ".git"),
			})
		end,

		-- handler for gopls
		["gopls"] = function()
			local lspconfig = require("lspconfig")
			lspconfig.gopls.setup({
				capabilities = capabilities,
				cmd = { "gopls" },
				filetypes = { "go", "gomod", "gowork", "gotmpl" },
				root_dir = lspconfig.util.root_pattern("go.work", "go.mod", ".git"),
				settings = {
					gopls = {
						completeUnimported = true,
						usePlaceholders = true,
						analyses = { unusedparams = true },
					},
				},
			})
		end,

		-- handler for luals
		["lua_ls"] = function()
			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
				settings = {
					Lua = {
						runtime = { version = "Lua 5.1" },
						diagnostics = {
							globals = { "bit", "vim", "it", "describe", "before_each", "after_each" },
						},
					},
				},
			})
		end,

		["cmake"] = function()
			local lspconfig = require("lspconfig")
			lspconfig.cmake.setup({
				capabilities = capabilities,
				cmd = { "cmake-language-server" },
				filetypes = { "cmake" },
				root_dir = lspconfig.util.root_pattern(
					"CMakePresets.json",
					"CTestConfig.cmake",
					".git",
					"build",
					"cmake"
				),
			})
		end,

		["typos_lsp"] = function()
			require("lspconfig").typos_lsp.setup({
				capabilities = capabilities,
				cmd = { "typos-lsp" },
				filetypes = { "*" },
			})
		end,
	},
})

local cmp_select = { behavior = cmp.SelectBehavior.Select }

cmp.setup({
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
		end,
	},
	mapping = cmp.mapping.preset.insert({
		["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
		["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
		["<C-y>"] = cmp.mapping.confirm({ select = true }),
		["<C-Space>"] = cmp.mapping.complete(),
	}),
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "luasnip" }, -- For luasnip users.
	}, {
		{ name = "buffer" },
	}),
})
