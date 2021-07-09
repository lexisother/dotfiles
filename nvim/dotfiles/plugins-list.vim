let s:ctx = g:dotfiles_plugins_list_context

" UI {{{
  call s:ctx.use('romgrk/barbar.nvim')
  call s:ctx.use('hoob3rt/lualine.nvim')
" }}}

" Files {{{
  call s:ctx.use('preservim/nerdtree')
  call s:ctx.use('kyazdani42/nvim-web-devicons')
" }}}

" Language specific {{{
  call s:ctx.use('alaviss/nim.nvim')
" }}}

" Misc {{{
  if has('nvim-0.5.0')
    call s:ctx.use('andweeb/presence.nvim')
  endif
" }}}
