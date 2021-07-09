local dotfiles_gruv = require'lualine.themes.gruvbox'
local colors = vim.g.dotfiles_colorscheme_base16_colors

-- Structure of themes is as follows:
-- a: Outer components, such as `NORMAL` text and line counts
-- b: secondary components, such git branch info
-- c: Middle components, basically everything in the middle

dotfiles_gruv.normal.a.bg = colors[12].gui

dotfiles_gruv.insert.a.bg = colors[14].gui
dotfiles_gruv.insert.c.bg = colors[2].gui

dotfiles_gruv.visual.a.bg = colors[15].gui
dotfiles_gruv.visual.c.bg = colors[2].gui
dotfiles_gruv.visual.c.fg = colors[7].gui

dotfiles_gruv.command.a.bg = colors[16].gui
dotfiles_gruv.command.c.bg = colors[2].gui
dotfiles_gruv.command.c.fg = colors[7].gui

require('lualine').setup{
  options = {
    theme = dotfiles_gruv
  }
}
