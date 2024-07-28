return {
	"stevearc/conform.nvim",
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
				go = { "goimports", "gofmt" },
				python = { "autopep8" },
				typescript = { "prettierd" },
				javascript = { "prettierd" },
				cpp = { "clang-format" },
				c = { "clang-format" },
				["*"] = { "codespell" },
				["_"] = { "trim_whitespaces" },
			},
			default_format_opts = {
				lsp_format = "fallback",
			},
			format_on_save = {
				-- I recommend these options. See :help conform.format for details.
				lsp_format = "fallback",
				timeout_ms = 500,
			},
			format_after_save = {
				lsp_format = "fallback",
			},
			log_level = vim.log.levels.ERROR,
			notify_on_error = true,
			notify_no_formatters = true,
		})
	end,
}
