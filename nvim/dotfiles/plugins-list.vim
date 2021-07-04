let s:ctx = g:dotfiles_plugins_list_context

" Files {{{
  call s:ctx.use('preservim/nerdtree')
" }}}

" Language specific {{{
  call s:ctx.use('alaviss/nim.nvim')
" }}}

" Misc {{{
  if has('nvim-0.5.0')
    call s:ctx.use('andweeb/presence.nvim')
  endif
" }}}
