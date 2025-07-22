local ok, lualine = pcall(require, 'lualine')
if not ok then return end;

local dotfiles_gruv = require'lualine.themes.gruvbox'
local theme = require'dotfiles.colorscheme'

-- https://github.com/dmitmel/dotfiles/commit/bf96e553764e3a166286f5a6a8017e01dadcf6f9
-- https://ptb.discord.com/channels/382339402338402315/382339402338402317/885864846892077086
local function get_color(index)
  local color = theme.base16_colors[index]
  return string.format('%06x', color.gui)
end

-- Structure of themes is as follows:
-- a: Outer components, such as `NORMAL` text and line counts
-- b: secondary components, such git branch info
-- c: Middle components, basically everything in the middle

dotfiles_gruv.normal.a.bg = get_color(11)

dotfiles_gruv.insert.a.bg = get_color(13)
dotfiles_gruv.insert.c.bg = get_color(1)

dotfiles_gruv.visual.a.bg = get_color(14)
dotfiles_gruv.visual.c.bg = get_color(1)
dotfiles_gruv.visual.c.fg = get_color(6)

dotfiles_gruv.command.a.bg = get_color(15)
dotfiles_gruv.command.c.bg = get_color(2)
dotfiles_gruv.command.c.fg = get_color(6)

dotfiles_gruv.replace.a.bg = get_color(8)
dotfiles_gruv.replace.c.bg = get_color(1)

-- Displays the currently selected Arduino board
local function showBoard()
  if vim.g.arduino_board then
    return '[' .. vim.g.arduino_board .. ']'
  end
end

lualine.setup{
  options = {
    theme = dotfiles_gruv
  }
}
