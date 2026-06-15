" This color theme was heavily inspired by: koehler
" vim: tw=0 ts=4 sw=4
" Vim color file
" Maintainer:	Benji York <benji@benjiyork.com>

hi clear
set background=dark
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "benji"
hi Normal		  guifg=white  guibg=black
hi Scrollbar	  guifg=darkcyan guibg=cyan
hi Menu			  guifg=black guibg=cyan
hi SpecialKey	  term=bold  ctermfg=100  guifg=#cc0000
hi NonText		  term=bold  cterm=bold  ctermfg=101  gui=bold      guifg=#cc0000
hi Directory	  term=bold  ctermfg=102  guifg=#cc8000
hi ErrorMsg		  term=standout   ctermfg=grey  ctermbg=red  guifg=White  guibg=Red
hi Search		  term=reverse  ctermfg=white  ctermbg=red      guifg=white  guibg=Red
hi MoreMsg		  term=bold  cterm=bold  ctermfg=103	gui=bold  guifg=SeaGreen
hi ModeMsg		  term=bold  cterm=bold  gui=bold  guifg=White	guibg=Blue
hi LineNrAbove	  term=bold  ctermfg=green	guifg=#00ff00
hi LineNrBelow	  term=bold  ctermfg=green	guifg=#00ff00
hi Question		  term=standout  cterm=bold  ctermfg=darkgreen	gui=bold  guifg=Green
hi StatusLine	  term=bold,reverse  cterm=bold ctermfg=blue ctermbg=white gui=bold guifg=blue guibg=white
hi StatusLineNC   term=reverse	ctermfg=white ctermbg=blue guifg=white guibg=blue
hi Title		  term=bold  cterm=bold  ctermfg=darkmagenta  gui=bold	guifg=Magenta
hi Visual		  term=reverse	cterm=reverse  gui=reverse
hi WarningMsg	  term=standout  ctermfg=darkred guifg=Red
"hi Cursor		  guifg=bg	guibg=Green
hi Comment		  term=bold  ctermfg=104  guifg=#80a0ff
hi Constant		  term=underline  ctermfg=magenta  guifg=#a0a0a0
hi Special		  term=bold  ctermfg=gray  guifg=#aaaaaa
hi Identifier	  term=underline   cterm=NONE ctermfg=105  guifg=#40ffff
hi Statement	  term=bold  cterm=bold ctermfg=yellow	gui=bold  guifg=#ffff60
hi Operator	  term=bold  cterm=bold ctermfg=yellow	gui=bold  guifg=#33ff99
hi PreProc		  term=underline  ctermfg=darkmagenta   guifg=#ff80ff
hi Type			  term=underline  cterm=bold ctermfg=106  gui=bold  guifg=#60ff60
hi Error		  term=reverse	ctermfg=darkcyan  ctermbg=black  guifg=Red	guibg=Black
hi Todo			  term=standout  ctermfg=black	ctermbg=darkcyan  guifg=Blue  guibg=Yellow
hi CursorLine	  term=underline  guibg=#555555 cterm=underline
hi CursorColumn	  term=underline  guibg=#555555 cterm=underline
hi MatchParen	  term=reverse  ctermfg=blue guibg=Blue
hi TabLine		  term=bold,reverse  cterm=bold ctermfg=lightblue ctermbg=white gui=bold guifg=blue guibg=white
hi TabLineFill	  term=bold,reverse  cterm=bold ctermfg=lightblue ctermbg=white gui=bold guifg=blue guibg=white
hi TabLineSel	  term=reverse	ctermfg=white ctermbg=lightblue guifg=white guibg=blue
hi Underlined	  term=underline cterm=bold,underline ctermfg=lightblue guifg=lightblue gui=bold,underline
hi Ignore		  ctermfg=black ctermbg=black guifg=black guibg=black
hi EndOfBuffer	  term=bold  cterm=bold  ctermfg=darkred guifg=#cc0000 gui=bold
hi link IncSearch		Visual
hi link String			Constant
hi link Character		Constant
hi Number cterm=NONE ctermfg=white guifg=white
hi link Boolean			Constant
hi link Float			Number
hi link Function		Identifier
hi link Conditional		Operator
hi link Repeat			Statement
hi link Label			Statement
hi link Operator		Operator
hi link Keyword			Statement
hi link Exception		Statement
hi link Include			PreProc
hi link Define			PreProc
hi link Macro			PreProc
hi link PreCondit		PreProc
hi link StorageClass	Type
hi link Structure		Type
hi link Typedef			Type
hi link Tag				Special
hi link SpecialChar		Special
hi link Delimiter		Special
hi link SpecialComment	Special
hi link Debug			Special

hi diffAdded ctermfg=green guifg=#00ff00
hi diffRemoved ctermfg=red guifg=#ff0000

hi Conceal guibg=black guifg=#FFC0C0
hi CocInlayHint guibg=black guifg=#337733
hi SignColumn guibg=#222222
