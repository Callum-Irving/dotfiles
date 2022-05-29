-- Utilities for creating configurations
local util = require "formatter.util"

-- Provides the Format and FormatWrite commands
require('formatter').setup {
  -- All formatter configurations are opt-in
  filetype = {
    python = {
      require('formatter.filetypes.python').black
    },
    html = {
      require('formatter.filetypes.html').prettier
    },
    htmldjango = {
      require('formatter.filetypes.html').prettier
    }
  }
}
