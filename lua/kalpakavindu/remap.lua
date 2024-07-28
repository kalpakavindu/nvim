local M = vim.keymap.set

M("n", "<leader>pv", vim.cmd.Ex)
M("n", "<leader>fm", require("conform").format)

M("n", "<C-k>", "<cmd>cnext<CR>zz")
M("n", "<C-j>", "<cmd>cprev<CR>zz")
M("n", "<leader>k", "<cmd>lnext<CR>zz")
M("n", "<leader>j", "<cmd>lprev<CR>zz")

M("v", "J", ":m '>+1<CR>gv=gv")
M("v", "K", ":m '<-2<CR>gv=gv")

M("n", "<leader>/", "gcc")
M("v", "<leader>/", "gc")
