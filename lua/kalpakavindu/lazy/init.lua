return {
  {
    "nvim-lua/plenary.nvim",
    name = "plenary",
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
