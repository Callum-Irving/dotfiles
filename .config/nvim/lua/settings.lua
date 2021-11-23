vim.cmd('filetype plugin indent on')
vim.cmd('syntax on')

vim.opt.termguicolors = true
vim.opt.number = true
vim.opt.scrolloff = 8

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.lbr = true 
vim.opt.swapfile = false
vim.opt.showmode = false

vim.opt.foldenable = false
vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'

vim.opt.incsearch = true
vim.opt.hlsearch = true

-- Set colorscheme and italic comments
vim.g.vscode_style = 'dark'
vim.cmd[[colorscheme vscode]]
vim.cmd('highlight Comment gui=italic cterm=italic')

-- Disable netrwhist
vim.cmd('let g:netrw_dirhistmax = 0')

-- Autocmds
local au = require('util.au')
au.group('CallumsGroup', {
  -- Highlight current line when editing
  {
    'InsertEnter',
    '*',
    function()
      vim.wo.cul = true
    end
  },
  {
    'InsertLeave',
    '*',
    function()
      vim.wo.cul = false
    end
  },
  {
    'TermOpen',
    '*',
    function()
      vim.wo.number = false
      vim.cmd('startinsert')
    end
  }
})
