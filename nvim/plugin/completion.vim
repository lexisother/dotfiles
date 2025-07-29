if !(dotplug#has('coc.nvim') && g:vim_ide == 1) | finish | endif

" Additional extensions {{{
" Go
call dotutils#add_unique(g:coc_global_extensions, 'coc-go')
" Common Lisp
call dotutils#add_unique(g:coc_global_extensions, 'coc-cl')
" PHP
call dotutils#add_unique(g:coc_global_extensions, 'coc-phpls')
call dotutils#add_unique(g:coc_global_extensions, 'coc-blade')
call dotutils#add_unique(g:coc_global_extensions, 'coc-tighten-lint')
" Shell
call dotutils#add_unique(g:coc_global_extensions, 'coc-sh')
" TeX
call dotutils#add_unique(g:coc_global_extensions, 'coc-vimtex')
" Vue
call dotutils#add_unique(g:coc_global_extensions, '@yaegassy/coc-volar')
" }}}

" Config {{{
let g:coc_user_config['prettier'] = {}
let g:coc_user_config['prettier']['printWidth'] = 80
" }}}
