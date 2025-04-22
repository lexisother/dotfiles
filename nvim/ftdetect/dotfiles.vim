function! s:genSrcInfo()
  :call system('rm -rf .SRCINFO; makepkg --printsrcinfo > .SRCINFO')
endfunction

autocmd BufNewFile,BufRead *.dream setf dream
autocmd BufNewFile,BufRead *.newlisp setf newlisp
