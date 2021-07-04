let g:k_nvim_dotfiles_dir = expand('<sfile>:p:h')
let g:k_dotfiles_dir = expand('<sfile>:p:h:h')
let &runtimepath = g:k_nvim_dotfiles_dir.','.&runtimepath

" Disable airline to use barbar
let g:loaded_airline = 1

" This has stopped working...?
" let g:dotfiles_plugin_manager_inhibited_plugins = {
" \ 'vim-airline': 1,
" \ }

" Enable the clearly superior mode.
let g:vim_ide = 1

" Small plugin configs
let g:dashboard_default_executive ='fzf'

" Source Dima's config
source <sfile>:p:h/../dmitmel-dotfiles/nvim/init.vim

let &runtimepath = &runtimepath.','.g:k_nvim_dotfiles_dir.'/after'

" Styling
set termguicolors
let airline_powerline_fonts = 1
