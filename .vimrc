"Setup Pathogen.vim
call pathogen#infect()
call pathogen#helptags()

""---------------------------------
" Key Mappings
"---------------------------------

"toggle functions for autowrap.
" (autowrap formats the paragraph when text is added/edited)
nmap \a :set formatoptions-=a<CR>:echo "autowrap disabled"<CR>
nmap \A :set formatoptions+=a<CR>:echo "autowrap enabled"<CR>

" toggle paste
map \p <Esc>:set paste!<CR>:set paste?<CR>
" toggle wrap
map \w <Esc>:set wrap!<CR>:set wrap?<CR>

" Make Visual Block selections not become unselected after
" doing ">>" or "<<" on them
vnoremap > ><CR>gv
vnoremap < <<CR>gv

" Squelch some annoying default behaviors..
map Q <silent>
map q: <silent>
map K <silent>
map q <silent>

"---------------------------------
" Options
"---------------------------------
set nocompatible
set ai
set backspace=2
set expandtab
set modeline
set shiftwidth=2
set tabstop=2
set smarttab
set showmatch
set formatoptions+=l

set scrolloff=10

set fileformats=unix " show the ^M's
set ignorecase      " for pattern matching...
set smartcase       " ...except when a mixed case is given
set mps+=<:>        " matchpairs
set ruler

" hide certain files in the file explorer
let g:explHideFiles='\.class$,\.swp$'

"use filetype plugins
filetype plugin on

" let there be COLOR!!
if has("terminfo")
 set t_Co=16
 set t_Sf=[3%p1%dm
 set t_Sb=[4%p1%dm
 set t_vb=
else
 set t_Co=16
 set t_Sf=[3%dm
 set t_Sb=[4%dm
 set t_vb=
endif

"---------------------------------
" Custom Coloring (i hate blue comments!)
"---------------------------------
syntax on
highlight Comment ctermfg=2
highlight Statement ctermfg=5


"---------------------------------
" Automatic Commands
"---------------------------------
" These settings get set based on the filename.
" (Many of these should get moved to ftplugins)

" Makefiles need tabs.
autocmd BufReadPre Makefile :set noexpandtab

" TeX Stuff
autocmd BufRead *.tex :set wrap noai
autocmd BufRead *.cls :set ft=tex wrap noai "for latex classes.

"Bcrypted files.
" decrypt on read.
autocmd BufReadCmd *.bfe :r! bcrypt -ro %
"autocmd BufWriteCmd *.bfe :w - | bcrypt -ro %

" load local settings, if any.
"source ~/.vimlocal
