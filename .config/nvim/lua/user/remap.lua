-- Execute command: <cmd> ... <CR> || : ... <CR>


-- set the <leader> key to SPACE
vim.g.mapleader = ' '


-- Visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selected text down"})
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selected text up"})

-- Quote selected area
vim.keymap.set("v", "qq", "<Esc>`<i'<Esc> `>a'", { desc = "[Q]uote selected text (single quotation marks)"})
vim.keymap.set("v", "QQ", '<Esc>`<i"<Esc> `>a"', { desc = "[Q]uote selected text (double quotation marks)"})



-- Normal mode
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Jump down (<C-d>) and center (zz) the cursor"})
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Jump up (<C-u>) and center (zz) the cursor"})
vim.keymap.set("n", "n", "nzzzv", { desc = "Center next word (n)"})
vim.keymap.set("n", "N", "Nzzzv", { desc = "Center previous word (N)"})


-- Open directory window (files/folders)
vim.keymap.set("n", "<leader>q", "<cmd> Ex <CR>", { desc = "Open Netrw (builtin file explorer)"})


-- ls -l
vim.keymap.set("n", "_ls", ":!ls -l %:S<CR>", { desc = "List files/folders in the current directory"})


-- Window resizing
-- change height
vim.keymap.set('n', '<C-j>', '<C-w>+', { desc = "Resize window [j] increase - vertiacl"})
vim.keymap.set('n', '<C-k>', '<C-w>-', { desc = "Resize window [k] decrease - vertical"})
-- change width
vim.keymap.set('n', '<C-h>', '<C-w><', { desc = "Resize window [h] decrease - horizontal"})
vim.keymap.set('n', '<C-l>', '<C-w>>', { desc = "Resize window [l] increase - horizontal"})


vim.keymap.set('n', '<leader>i', '<cmd>Inspect<CR>', { desc = "[I]nspect highlighting under the cursor"})

