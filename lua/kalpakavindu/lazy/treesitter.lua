return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = require("kalpakavindu.config.treesitter"),
}
