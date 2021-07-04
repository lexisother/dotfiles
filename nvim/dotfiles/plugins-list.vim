let s:ctx = g:dotfiles_plugins_list_context

" Files {{{
  call s:ctx.use('preservim/nerdtree')
  call s:ctx.use('kyazdani42/nvim-web-devicons')
  call s:ctx.use('romgrk/barbar.nvim')
" }}}

" Language specific {{{
  call s:ctx.use('alaviss/nim.nvim')
" }}}

" Misc {{{
call s:ctx.use('glacambre/firenvim', { 'do': ':call firenvim#install(0)' })
  call s:ctx.use('glepnir/dashboard-nvim')
  if has('nvim-0.5.0')
    call s:ctx.use('andweeb/presence.nvim')
  endif
" }}}
