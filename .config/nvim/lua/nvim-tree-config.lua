vim.g.nvim_tree_quit_on_open = 1
vim.g.nvim_tree_disable_window_picker = 1
-- vim.g.nvim_tree_window_picker_chars = '123456789ABCD'

require('nvim-tree').setup {
  auto_close = true,
  open_on_setup = true,
  hijack_cursor = true
}

