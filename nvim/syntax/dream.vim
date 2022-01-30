" Syntax highlighting for .dream files.
syntax match dreamGrime '\v\d'
syntax match dreamComments '\v^\^(.*)$'
syntax match dreamCommands '\v^\^ (tags|title|secret|align|curtains|grimes|colour) \^ (.*) \^$'
syntax match dreamIllegal '\v^\^ (justify|color) \^ (.*) \^$'

hi def link dreamGrime Identifier
hi def link dreamComments Comment
hi def link dreamCommands Statement
hi def link dreamIllegal Error
