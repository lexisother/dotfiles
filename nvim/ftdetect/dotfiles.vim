function! s:genSrcInfo()
  :call system('rm -rf .SRCINFO; makepkg --printsrcinfo > .SRCINFO')
endfunction

augroup dotfilesftdetect
  autocmd BufWritePost PKGBUILD :call s:genSrcInfo()

  autocmd BufNewFile,BufRead *.dream setf dream
augroup END
