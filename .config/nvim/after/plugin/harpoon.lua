local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>a", mark.add_file, { desc = "Harpoon - [A]dd item to list"})
vim.keymap.set("n", "<leader>e", ui.toggle_quick_menu, { desc = "Harpoon - ([E]dit) Toggle quick menu"})

-- <C-h> - CTRL
vim.keymap.set("n", "<leader>1", function() ui.nav_file(1) end, { desc = "Harpoon - Open file 1"})
vim.keymap.set("n", "<leader>2", function() ui.nav_file(2) end, { desc = "Harpoon - Open file 2"})
vim.keymap.set("n", "<leader>3", function() ui.nav_file(3) end, { desc = "Harpoon - Open file 3"})
vim.keymap.set("n", "<leader>4", function() ui.nav_file(4) end, { desc = "Harpoon - Open file 4"})
vim.keymap.set("n", "<leader>5", function() ui.nav_file(5) end, { desc = "Harpoon - Open file 5"})
