let bufferline = get(g:, 'bufferline', {})
let bufferline.icons = 'both'

" Navigating buffers
nnoremap <silent> <A-,> :BufferPrevious<CR>
nnoremap <silent> <A-.> :BufferNext<CR>
nnoremap <silent> <A-s> :BufferPick<CR>

nnoremap <silent> <A-c> :BufferClose<CR>
