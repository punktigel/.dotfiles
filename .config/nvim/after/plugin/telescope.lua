local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = "Telescope - [F]ind [F]iles"}) -- files in dir
vim.keymap.set('n', '<leader>fz', "<cmd>Telescope current_buffer_fuzzy_find<CR>",{ desc = "Telescope - Current buffer [F]u[Z]zy find"})

-- add parameters with a table in a function
-- function() builtin.telescope_function({ config }) end
vim.keymap.set('n', '<leader>fd', function() builtin.find_files({ cwd = "~/"..vim.fn.input("Directory > ")}) end, {desc = "Telescope - [F]ind files in the specified [D]irectory"})
vim.keymap.set('n', '<leader>fn', function() builtin.find_files({ cwd = "~/.config/nvim"}) end, { desc = "Telescope - [F]ind [N]vim config files"})

-- History
vim.keymap.set('n', '<leader>ch', builtin.command_history, { desc = "Telescope - [C]ommand [H]istory"})
vim.keymap.set('n', '<leader>sh', builtin.search_history, { desc = "Telescope - [S]earch [H]istory"})

-- Git
vim.keymap.set('n', '<leader>gb', builtin.git_branches, { desc = "Telescope - [G]it [B]ranches"})
vim.keymap.set('n', '<leader>gf', builtin.git_files, { desc = "Telescope - [G]it [F]iles"})
vim.keymap.set('n', '<leader>gc', builtin.git_commits, { desc = "Telescope - [G]it [C]ommits"})
vim.keymap.set('n', '<leader>gC', builtin.git_bcommits, { desc = "Telescope - [G]it [C]ommits on this branch"})
vim.keymap.set('n', '<leader>gi', builtin.git_status, { desc = "Telescope - [G]it status ([I]nfo)"})


vim.keymap.set('n', '<leader>fs', builtin.grep_string, { desc = "Telescope - [F]ind [S]tring"})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = "Telescope - Live grep"})

vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = "Telescope - [F]iles in the [B]uffer"})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = "Telescope - [F]ind [H]elp tags"})

vim.keymap.set('n', '<leader>hg', builtin.highlights, { desc = "Telescope - Show [H]ighlight [G]roups"})
vim.keymap.set('n', '<leader>k', builtin.keymaps, { desc = "Telescope - Show [K]eymaps"})
