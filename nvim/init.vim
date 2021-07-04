let g:k_nvim_dotfiles_dir = expand('<sfile>:p:h')
let g:k_dotfiles_dir = expand('<sfile>:p:h:h')
let &runtimepath = g:k_nvim_dotfiles_dir.','.&runtimepath.','.g:k_nvim_dotfiles_dir.'/after'

" Disable the following plugins from Dima's list
" https://github.com/dmitmel/dotfiles/commit/ae79a2b708c79cf91a889737e69b7256681d0478
let g:dotfiles_plugin_manager_inhibited_plugins = {
\ 'vim-airline': 1,
\ }

" Enable the clearly superior mode.
let g:vim_ide = 1

" Small plugin configs
let g:dashboard_default_executive ='fzf'

" Source Dima's config
source <sfile>:p:h/../dmitmel-dotfiles/nvim/init.vim

" Styling
set termguicolors
let airline_powerline_fonts = 1
