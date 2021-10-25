-- Disable airline to use barbar
vim.g.loaded_airline = 1

-- TODO: Refactor to Lua
-- This has stopped working...?
-- let g:dotfiles_plugin_manager_inhibited_plugins = {
-- \ 'vim-airline': 1,
-- \ }

-- Small plugin configs
vim.g.dashboard_default_executive ='fzf'

-- Styling
vim.o.termguicolors = true
