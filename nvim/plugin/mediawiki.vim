let s:WIKI_URL = 'wiki.c2dl.info'

let g:mediawiki_editor_url = s:WIKI_URL
let g:mediawiki_editor_path = "/w/"
let g:mediawiki_editor_username = "lexisother"

let g:vim_mediawiki_site = s:WIKI_URL
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
