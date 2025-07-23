" Add my paths to the rtp
let g:a_nvim_dotfiles_dir = expand('<sfile>:p:h')
let g:a_dotfiles_dir = expand('<sfile>:p:h:h')
let &runtimepath = g:a_nvim_dotfiles_dir.','.&runtimepath.','.g:a_nvim_dotfiles_dir.'/after'

" dotfiles configuration
let g:vim_ide = 2
let g:dotfiles_rainbow_indent_opacity = 0.5
let g:dotfiles_treesitter_highlighting = v:true
let g:dotfiles_highlight_url_under_cursor = v:true

" Disables Airline's tabline to use barbar instead
let g:airline#extensions#tabline#enabled = 1

source <sfile>:p:h/../dmitmel-dotfiles/nvim/init.vim

" Doesn't hurt to try and set again.
set termguicolors

" Arrow key fix kanged from <https://vim.fandom.com/wiki/Fix_arrow_keys_that_display_A_B_C_D_on_remote_shell#Solution_21> {{{
  if exists("g:HELP_MY_ARROW_KEYS_ARE_BROKEN")
    " the following simply creates an ambiguous mapping so vim fully
    " processes the escape sequence for terminal keys, see 'ttimeout' for a
    " rough explanation, this just forces it to work
    if &term[:4] == "xterm" || &term[:5] == 'screen' || &term[:3] == 'rxvt'
      inoremap <silent> <C-[>OC <RIGHT>
    endif
  endif
" }}}
