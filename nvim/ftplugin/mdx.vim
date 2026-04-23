if exists("b:did_ftplugin")
  finish
endif
let b:did_ftplugin = 1

" Taken from $VIMRUNTIME/ftplugin/javascript.vim
exe dotfiles#ft#setlocal('comments=sO:*\ -,mO:*\ \ ,exO:*/,s1:/*,mb:*,ex:*/,://')
exe dotfiles#ft#setlocal('commentstring=//\ %s')
