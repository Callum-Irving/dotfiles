require('fzf-lua').setup {
  winopts = {
    -- border = 'none',
    preview = {
      border = 'noborder',
    },
  },
  git = {
    files = {
      cmd = 'git ls-files -co --exclude-standard',
    },
  },
}

