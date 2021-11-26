vim.g.indent_blankline_use_treesitter = true
require('indent_blankline').setup {
  filetype_exclude = {'NvimTree', 'packer'},
  buftype_exclude = {'terminal'}
}

