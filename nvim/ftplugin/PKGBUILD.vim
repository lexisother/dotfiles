function! s:genSrcInfo()
  :call system('rm -rf .SRCINFO; makepkg --printsrcinfo > .SRCINFO')
endfunction

autocmd BufWritePost PKGBUILD :call s:genSrcInfo()
