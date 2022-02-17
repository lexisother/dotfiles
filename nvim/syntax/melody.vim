" Syntax highlighting for *.mdy files.
syntax match melodyKeyword '\v(char|of|capture|to|of|some|start|end|match)'
syntax match melodyConstant '\v\<(.*)\>'
syntax match melodyNum '\v\d+'
syntax match melodyComment '\v\/\/.*'
syntax match melodyString '\v\"(.*)\"'

hi def link melodyKeyword Statement
hi def link melodyConstant Constant
hi def link melodyNum Number
hi def link melodyComment Comment
hi def link melodyString String
