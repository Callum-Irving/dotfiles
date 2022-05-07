-- vim.g.nvim_tree_window_picker_chars = '123456789ABCD'

require('nvim-tree').setup {
  open_on_setup = true,
  hijack_cursor = true,
  actions = {
    open_file = {
      quit_on_open = true,
      window_picker = {
        enable = false,
      },
    },
  },
}

