local M = vim.keymap.set

M("n", "<leader>pv", vim.cmd.Ex)
M("n", "<leader>fm", require("conform").format)

M("v", "<C-Up>", ":m '>+1<CR>gv=gv")
M("v", "<C-Down>", ":m '<-2<CR>gv=gv")

M("n", "J", "mzJ`z")
M("n", "n", "nzzzv")
M("n", "N", "Nzzzv")

M("x", "<leader>p", "\"_dP")

M("n", "<leader>y", "\"+y")
M("v", "<leader>y", "\"+y")
M("n", "<leader>Y", "\"+Y")
M("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
M("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

M("n", "<C-/>", "gcc")
M("v", "<C-/>", "gc")
M("n", "<C-Left>", "<C-w>h", { desc = "switch window left" })
M("n", "<C-Right>", "<C-w>l", { desc = "switch window right" })
M("n", "<C-Down>", "<C-w>j", { desc = "switch window down" })
M("n", "<C-Up>", "<C-w>k", { desc = "switch window up" })
