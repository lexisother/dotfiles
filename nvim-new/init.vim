" Honestly, the only reason this file is even here is because of the stupid
" runtimepath. Nothing else.

let g:nvim_dotfiles_dir = expand('<sfile>:p:h')

" <https://github.com/dmitmel/dotfiles/blob/744f5294773111a3a2c778f34273e67b40c66671/nvim/init.vim#L24-L34>
function! s:configure_runtimepath() abort
	let rtp = split(&runtimepath, ',')
	let dotf = g:nvim_dotfiles_dir
	if index(rtp, dotf         ) < 0 | call insert(rtp, dotf         ) | endif
	if index(rtp, dotf.'/after') < 0 | call    add(rtp, dotf.'/after') | endif
	let &runtimepath = join(rtp, ',')
endfunction
call s:configure_runtimepath()

luafile <sfile>:h/init.lua
