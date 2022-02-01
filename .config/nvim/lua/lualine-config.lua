-- Get LSP name and check if it is stopped
local lsp_status = {
  function ()
    local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
    local clients = vim.lsp.get_active_clients()
    if next(clients) == nil then
      return ''
    end
    for _, client in ipairs(clients) do
      local filetypes = client.config.filetypes
      if filetypes and vim.fn.index(filetypes, buf_ft) ~= 1 then
        return '[LSP] ' .. client.name .. (client.is_stopped() and ' (STOPPED)' or '')
      end
    end
    return ''
  end,
  left_padding = 2
}

require('lualine').setup {
  options = {
    theme = 'gruvbox',
    component_separators = '|',
    section_separators = { left = '', right = '' },
  },
  sections = {
    lualine_a = {
      { 'mode', separator = { left = '' }, right_padding = 2 },
    },
    lualine_b = { 'filename', 'branch', 'diff' },
    lualine_c = { lsp_status, 'diagnostics' },
    lualine_x = {},
    lualine_y = { 'filetype', 'progress' },
    lualine_z = {
      { 'location', separator = { right = '' }, left_padding = 2 },
    },
  },
  inactive_sections = {
    lualine_a = { 
      { 'filename', separator = { left = '' }, right_padding = 2 },
    },
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {
      { 'location', separator = { right = '' }, left_padding = 2 },
    },
  },
  tabline = {},
  extensions = {},
}

