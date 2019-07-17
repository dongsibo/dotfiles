"           ██
"          ░░
"  ██    ██ ██ ██████████  ██████  █████
" ░██   ░██░██░░██░░██░░██░░██░░█ ██░░░██
" ░░██ ░██ ░██ ░██ ░██ ░██ ░██ ░ ░██  ░░
"  ░░████  ░██ ░██ ░██ ░██ ░██   ░██   ██
"   ░░██   ░██ ███ ░██ ░██░███   ░░█████
"    ░░    ░░ ░░░  ░░  ░░ ░░░     ░░░░░
"
" NOTE some settings or commands are already provided in the system-wide vimrc
" (one of which is /usr/share/vim/vimfiles/archlinux.vim)


" plugins
" =======

if empty(glob('~/.vim/autoload/plug.vim'))
  silent call system('curl -fLo ~/.vim/autoload/plug.vim https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim')
  execute 'source  ~/.vim/autoload/plug.vim'
  augroup plugsetup
    au!
    autocmd VimEnter * PlugInstall
  augroup end
endif

call plug#begin('~/.vim/plugged')

" NOTE remember to use single quotes

Plug 'itchyny/lightline.vim'      " lightweight statusline
Plug 'justinmk/vim-syntax-extra'  " better syntax highlighting for c-related files

" NOTE additional functions may be required for some functions (like
" vim-fugitive for git commits)
"Plug 'junegunn/fzf.vim'           " fzf enhancements for vim

call plug#end()


" plugin settings
" ===============

" lightline.vim
set laststatus=2 noshowmode


" general
" =======

runtime! defaults.vim        " use enhanced Vim defaults
set mouse=                   " reset the mouse setting from defaults
let g:skip_defaults_vim = 1  " do not source defaults.vim again (after loading this vimrc)
set confirm                  " raise a dialogue for unsaved changes
set hidden                   " allow buffer switching with unsaved changes
set ignorecase smartcase     " case-insensitive search (unless capitals)


" ui
" ==

colorscheme my-pablo                       " custom pablo colorscheme
set number relativenumber                  " hybrid line numbers
"set listchars=tab:>-,trail:·,nbsp:… list!  " show some invsible characters
"set listchars=tab:«\ »,trail:·,nbsp:… list!  " show some invsible characters
set listchars=tab:»\ ,trail:·,nbsp:… list!  " show some invsible characters
set hlsearch                               " highlight all occurences from a search
set visualbell                             " turn on visual bell; much quieter than audio blink


" commands
" ========

" toggle highlight search
nnoremap <silent> \ :set hlsearch! | :set hlsearch?<CR>
