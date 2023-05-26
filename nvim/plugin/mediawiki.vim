let g:vim_mediawiki_site = 'wiki.c2dl.info'
if has('macunix')
  let g:vim_mediawiki_browser_command = 'open \r'
else
  let g:vim_mediawiki_browser_command = 'xdg-open \r'
endif
let g:vim_mediawiki_completion_prefix_length = 5
let g:vim_mediawiki_completion_limit = 5
let g:vim_mediawiki_completion_namespaces = {
\ 'default': {
\       '[[': 0,
\       '{{': 10,
\       '[[File:': 6,
\       '[[Category:': 14,
\   },
\ 'wiki.c2dl.info': {
\       '[[': 0,
\       '{{': 10,
\       '[[File:': 6,
\       '[[Category:': 14,
\   },
\ }
