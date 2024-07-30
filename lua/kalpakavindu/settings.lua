vim.g.mapleader = " "

local M = vim.opt;

M.nu = true
M.relativenumber = true

M.tabstop = 2
M.softtabstop = 2
M.shiftwidth = 2
M.expandtab = true

M.smartindent = true

M.wrap = true

M.swapfile = false
M.backup = false

if os.getenv("HOME") == nil then
  M.undodir = os.getenv("USERPROFILE") .. "/.vim/undodir"
else
  M.undodir = os.getenv('HOME') .. "/.vim/undodir"
end

M.undofile = true

M.hlsearch = false
M.incsearch = true

M.termguicolors = true

M.scrolloff = 8
M.signcolumn = "yes"
M.isfname:append("@-@")

M.updatetime = 50

M.colorcolumn = "120"
