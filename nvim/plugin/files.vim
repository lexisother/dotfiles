" Functions {{{
  function! SourceIfExists(file)
    if filereadable(expand(a:file))
      exe 'source ' a:file
    endif
  endfunction
" }}}

" Automatically load project-specific config if present
let g:proj_root = finddir('.git/..', expand('%:p:h').';')
call SourceIfExists(expand(g:proj_root..'/project.vim'))
