return {
	{ "nvim-lua/plenary.nvim", name = "plenary" },
	"nvim-tree/nvim-web-devicons",
	"numToStr/Comment.nvim",
	"stevearc/conform.nvim",
	"VonHeikemen/lsp-zero.nvim",
	"neovim/nvim-lspconfig",
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"hrsh7th/cmp-cmdline",
	"hrsh7th/nvim-cmp",
	"L3MON4D3/LuaSnip",
	"saadparwaiz1/cmp_luasnip",
	"j-hui/fidget.nvim",
	{
		"olexsmir/gopher.nvim",
		ft = "go",
		build = function()
			vim.cmd([[silent! GoInstallDeps]])
		end,
	},
	"nvim-lualine/lualine.nvim",
	{
		"L3MON4D3/LuaSnip",
		-- follow latest release.
		version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
		-- install jsregexp (optional!).
		build = "make install_jsregexp",
		dependencies = { "rafamadriz/friendly-snippets" },
	},
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	"folke/tokyonight.nvim",
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
	},
}
