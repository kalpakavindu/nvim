return {
  {
    "nvim-lua/plenary.nvim",
    name = "plenary",
  },
  {
    "nvim-tree/nvim-web-devicons",
    config = require("kalpakavindu.config.icons"),
  },
  {
    "olexsmir/gopher.nvim",
    ft = "go",
    config = require("kalpakavindu.config.gopher"),
    build = function()
      vim.cmd [[silent! GoInstallDeps]]
    end
  }
}
