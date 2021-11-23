local map = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true }

vim.g.mapleader = ' '

map('n', '<C-p>', ':GFiles<CR>', default_opts)
map('n', '<C-n>', ':NvimTreeToggle<CR>', default_opts)
map('n', 'x', '"_x', default_opts)
map('n', '<leader><BSlash>', ':noh<CR>', default_opts)

-- Split navigation
map('n', '<leader>h', '<C-W>h', default_opts)
map('n', '<leader>j', '<C-W>j', default_opts)
map('n', '<leader>k', '<C-W>k', default_opts)
map('n', '<leader>l', '<C-W>l', default_opts)
map('n', '<leader>H', '<C-W>H', default_opts)
map('n', '<leader>J', '<C-W>J', default_opts)
map('n', '<leader>K', '<C-W>K', default_opts)
map('n', '<leader>L', '<C-W>L', default_opts)

-- Split creation
map('n', '<leader>n', ':new<CR>', default_opts)
map('n', '<leader>m', ':vnew<CR>', default_opts)
map('n', '<leader>N', ':lefta new<CR>', default_opts)
map('n', '<leader>M', ':lefta vnew<CR>', default_opts)

-- Exit terminal with escape key
map('t', '<Esc>', [[<C-\><C-n>]], default_opts)

