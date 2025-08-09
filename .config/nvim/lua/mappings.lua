require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("n", "<leader>wd", "<cmd> DiagnosticToggle <cr>", { desc = "Turn off warnings" })
map("t", "<ESC><ESC>", "<C-\\><C-n>", {noremap = true, silent = true})
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
