local map = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true }

vim.g.mapleader = ' '

map('n', '<C-n>', ':NvimTreeToggle<CR>', default_opts)
map('n', 'x', '"_x', default_opts)
map('n', '<leader><BSlash>', ':noh<CR>', default_opts)
map('n', '<leader>T', ':TodoTrouble<CR>', default_opts)

-- Git
map('n', '<leader>G', ':Neogit<CR>', default_opts)

-- FZF
map('n', '<C-p>', ':FzfLua git_files<CR>', default_opts)
map('n', '<leader>.', ':FzfLua grep_project<CR>', default_opts)
map('n', '<leader>b', ':FzfLua buffers<CR>', default_opts)

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

-- Split resizing
map('n', '<C-=>', ':vert res +5<CR>', default_opts)
map('n', '<C-->', ':vert res -5<CR>', default_opts)

-- Exit terminal with escape key
-- Breaks exiting FZF with escape
-- map('t', '<Esc>', [[<C-\><C-n>]], default_opts)

-- vsnip navigation
vim.cmd [[
  imap <expr> <C-j> vsnip#jumpable(1) ? '<Plug>(vsnip-jump-next)' : '<C-j>'
  smap <expr> <C-j> vsnip#jumpable(1) ? '<Plug>(vsnip-jump-next)' : '<C-j>'
  imap <expr> <C-k> vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-prev)' : '<C-k>'
  smap <expr> <C-k> vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-prev)' : '<C-k>'
]]

-- Format
map('n', '<leader>F', ':Neoformat<CR>', default_opts)

