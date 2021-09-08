-- Disable airline to use barbar
vim.g.loaded_airline = 1

-- TODO: Refactor to Lua
-- This has stopped working...?
-- let g:dotfiles_plugin_manager_inhibited_plugins = {
-- \ 'vim-airline': 1,
-- \ }

-- Enable the clearly superior mode.
vim.g.vim_ide = 1
vim.g.dotfiles_build_coc_from_source = 1

-- Small plugin configs
vim.g.dashboard_default_executive ='fzf'

-- Styling
vim.g.termguicolors = 1
vim.g.airline_powerline_fonts = 1
