local cmp = require('cmp')
local lspkind = require('lspkind')

cmp.setup {
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  -- completion settings
  completion = {
    completeopt = 'menu,menuone,noinsert',
    keyword_length = 2
  },
  -- key mapping
  mapping = {
    ['<C-j>'] = cmp.mapping.select_next_item(),
    ['<C-k>'] = cmp.mapping.select_prev_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = false, -- false makes it so that you must explicilty select an item
    },
    -- Tab mapping
    -- ['<Tab>'] = function(fallback)
    --   if cmp.visible() then
    --     cmp.select_next_item()
    --   else
    --     fallback()
    --   end
    -- end,
    -- ['<S-Tab>'] = function(fallback)
    --   if cmp.visible() then
    --     cmp.select_prev_item()
    --   else
    --     fallback()
    --   end
    -- end
  },
  -- load sources, see: https://github.com/topics/nvim-cmp
  sources = {
    { name = 'nvim_lua' },
    { name = 'nvim_lsp' },
    { name = 'vsnip' },
    { name = 'path' },
  },
  formatting = {
    format = lspkind.cmp_format({
      with_text = true,
      menu = ({
        buffer = "[BUF]",
        nvim_lsp = "[LSP]",
        vsnip = "[SNIP]",
        nvim_lua = "[LUA]"
      })
    })
  }
}

