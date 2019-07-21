" these lines are suggested to be at the top of every colorscheme
highlight clear
if exists("syntax_on")
  syntax reset
endif

" load the "base" colorscheme - the one to be altered
runtime colors/pablo.vim

" override the name of the base colorscheme with the name of this custom one
let g:colors_name = "my-pablo"

" clear the colors for any items that you don't like
highlight clear Comment
highlight clear CursorLineNr
highlight clear LineNr
highlight clear SpecialKey

" set up your new & improved colors
"highlight Comment	ctermfg=244	guifg=#808080
highlight Comment	ctermfg=Grey	guifg=#a8a8a8
highlight CursorLineNr	ctermfg=Yellow	cterm=bold	guifg=#ffff00	gui=bold
"highlight LineNr	ctermfg=Grey	guifg=#a8a8a8
highlight LineNr	ctermfg=Yellow	guifg=#ffff00
"highlight LineNr	ctermfg=244	guifg=#808080
highlight SpecialKey	ctermfg=Blue	guifg=#0000ff
