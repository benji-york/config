" Vim syntax file for Python coverage reports (.py,cover)

if exists("b:current_syntax")
  finish
endif

runtime! syntax/python.vim
unlet! b:current_syntax

syn match pycovCovered /^>/ containedin=ALL
syn match pycovUncovered /^!/ containedin=ALL

hi def pycovCovered ctermfg=2 guifg=#2d5a2d
hi def pycovUncovered ctermfg=0 ctermbg=1 guifg=#000000 guibg=#cc0000

let b:current_syntax = "pycov"
