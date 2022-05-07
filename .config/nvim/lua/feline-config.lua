require('gitsigns').setup()

local colors = {
  bg = '#282828',
  black = '#282828',
  yellow = '#d79921',
  cyan = '#689d6a',
  oceanblue = '#458588',
  green = '#98971a',
  orange = '#fb4934',
  violet = '#d3869b',
  magenta = '#b16286',
  white = '#ebdbb2',
  fg = '#a89984',
  skyblue = '#83a598',
  red = '#cc241d',
}

local vi_mode_colors = {
  NORMAL = 'green',
  OP = 'green',
  INSERT = 'skyblue',
  CONFIRM = 'red',
  VISUAL = 'skyblue',
  LINES = 'skyblue',
  BLOCK = 'skyblue',
  REPLACE = 'violet',
  ['V-REPLACE'] = 'violet',
  ENTER = 'cyan',
  MORE = 'cyan',
  SELECT = 'orange',
  COMMAND = 'green',
  SHELL = 'green',
  TERM = 'green',
  NONE = 'yellow'
}

require('feline').setup {
  preset = 'noicon',
  theme = colors,
  default_bg = bg,
  default_fg = fg,
  vi_mode_colors = vi_mode_colors,
}
