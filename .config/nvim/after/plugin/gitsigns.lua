require('gitsigns').setup {
  signs = {
    add          = { text = '│' },
    change       = { text = '│' },
    delete       = { text = '_' },
    topdelete    = { text = '‾' },
    changedelete = { text = '~' },
    untracked    = { text = '┆' },
  },
  signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
  numhl      = false, -- Toggle with `:Gitsigns toggle_numhl`
  linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
  word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
  watch_gitdir = {
    follow_files = true
  },
  attach_to_untracked = true,
  current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
    delay = 1000,
    ignore_whitespace = false,
  },
  current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
  sign_priority = 6,
  update_debounce = 100,
  status_formatter = nil, -- Use default
  max_file_length = 40000, -- Disable if file is longer than this (in lines)
  preview_config = {
    -- Options passed to nvim_open_win
    border = 'single',
    style = 'minimal',
    relative = 'cursor',
    row = 0,
    col = 1
  },
}


vim.keymap.set('n', 'gh', '<cmd>Gitsigns preview_hunk <cr>', { desc = "[G]itsigns preview [H]unk"})
vim.keymap.set('n', 'gn', '<cmd>Gitsigns next_hunk <cr>', { desc = "[G]itsigns [N]ext hunk"})
vim.keymap.set('n', 'gN', '<cmd>Gitsigns prev_hunk <cr>', { desc = "[G]itsigns previous hunk"})

vim.keymap.set('n', 'gsh', '<cmd>Gitsigns stage_hunk <cr>', { desc = "[G]itsigns [S]tage [H]unk"})
vim.keymap.set('n', 'guh', '<cmd>Gitsigns undo_stage_hunk <cr>', { desc = "[G]itsigns [U]ndo stage [H]unk"})
vim.keymap.set('n', 'grh', '<cmd>Gitsigns reset_hunk <cr>', { desc = "[G]itsigns [R]eset [H]unk"})

