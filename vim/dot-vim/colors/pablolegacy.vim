" local syntax file - set colors on a per-machine basis:
" vim: tw=0 ts=4 sw=4
" Vim color file modified from [1] due to pablo (and other colour schemes)
" being reworked in vim 8.2.4981 per [2]
" Maintainer:	Ron Aaron <ron@ronware.org>
" Last Change:	2003 May 02
"
" [1] https://github.com/vim/colorschemes/blob/master/legacy_colors/pablo.vim
" [2] https://github.com/vim/vim/commit/30ab04e16e1e9e6133590181197b3f8e70cb495e

highlight clear
set background=dark
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "pablolegacy"

highlight Comment	ctermfg=Grey	guifg=#a8a8a8
highlight Constant	 ctermfg=14			   cterm=none guifg=#00ffff				  gui=none
highlight Identifier ctermfg=6						  guifg=#00c0c0
highlight Statement  ctermfg=3			   cterm=bold guifg=#c0c000				  gui=bold
highlight PreProc	 ctermfg=10						  guifg=#00ff00
highlight Type		 ctermfg=2						  guifg=#00c000
highlight Special	 ctermfg=12						  guifg=#0000ff
highlight Error					ctermbg=9							guibg=#ff0000
highlight Todo		 ctermfg=4	ctermbg=3			  guifg=#000080 guibg=#c0c000
highlight Directory  ctermfg=2						  guifg=#00c000
highlight StatusLine ctermfg=11 ctermbg=12 cterm=none guifg=#ffff00 guibg=#0000ff gui=none
highlight Normal									  guifg=#ffffff guibg=#000000
highlight Search				ctermbg=3							guibg=#c0c000
highlight SpecialKey	ctermfg=Blue	guifg=#0000ff
