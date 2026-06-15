set vb t_vb= "no bells at all
"set guifont=Ubuntu\ Mono\ 14
if has('macunix')
    "set guifont=JetBrainsMono\ Regular\ 10
    "set guifont=JetBrainsMono-Regular:h15
    set guifont=JetBrainsMono\ Nerd\ Font\ Mono:h15
    set macligatures
    " To fix mis-sized MacVim windows, run commands like these:
    "defaults write org.vim.MacVim MMTextInsetBottom '10'
    "defaults write org.vim.MacVim MMTextInsetRight '7'
endif
colorscheme benji
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar

" highlight trailing whitespace
highlight ExtraWhitespace guibg=#222222 ctermfg=131
