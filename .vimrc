"Surya Teja D .vimrc configuration file

" essentials {{{
set nocompatible                        "use vim settings instead of vi
set modelines=0                            "prevents some security exploits having to do with modelines in files
" }}}

"vim-plug plugins {{{
call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'vim-airline/vim-airline'        " display buffers on screen like tabs
Plug 'justinmk/vim-gtfo'              " terminal-got,folder-gof
Plug 'danro/rename.vim'               
Plug 'terryma/vim-multiple-cursors'   " multiple cursors
Plug 'while1eq1/vim-monokai-black'    " black monokai instead of grey
Plug 'godlygeek/tabular'              " aligns text
Plug 'scrooloose/nerdcommenter'          " commenter
Plug 'mhinz/vim-startify'             " fancy start screen
Plug 'vim-scripts/mru.vim'
Plug 'mhartington/oceanic-next'
Plug 'tpope/vim-fugitive'             " Git wrapper
Plug 'easymotion/vim-easymotion'
Plug 'joshdick/onedark.vim'
Plug 'reedes/vim-colors-pencil'
Plug 'suan/vim-instant-markdown'
Plug 'tpope/vim-surround'

call plug#end()
"}}}

" interface {{{
set t_Co=256
set expandtab  " set tab to 4 spaces
set tabstop=4
set noet ci pi sts=0 sw=4 ts=4  " for auto indentation
set guifont=Monospace\ 11    "set default font
set showmatch  " when your cursor moves over a parenthesis-like character, the matching one will be highlighted as well
set autoread
au CursorHold * checktime  
colorscheme OceanicNext
set number  " show line numbers
set guioptions-=T guioptions-=m guioptions-=r  " hide toolbar,menubar,right scroll
set hidden  " hide inactive buffers
" }}}

" foldings {{{
set nofoldenable                " fold by default
nnoremap <space> za
set foldmethod=indent            " fold by indent
:setlocal foldmethod=marker        " set fold method of .vimrc to marker
set foldnestmax=1                " fold only top level
" }}}

" features {{{
syntax on
set mouse=a  " Enable Mouse
set dictionary=/usr/share/dict/words  " Dictionary path, from which the words are being looked up
:set sessionoptions=buffers        "save buffer sessions with :mksession
let g:netrw_liststyle=3            "set default netrw style
set splitright                    "":vs will split window vertically
set wildmenu                    "graphical menu of folder contents when :e <tab> is pressed
set incsearch                    "search as characters are entered
set hlsearch                    "in search, highlight matches
set autochdir                    " change working dir to present dir
let @/=""                        " remove highlight
set clipboard=unnamedplus        " uses clipboard for yank
set noswapfile
"highlight cursor line in insert mode
autocmd InsertEnter * set cul
autocmd InsertLeave * set nocul
set encoding=UTF-8
set colorcolumn=72,79 
highlight ExtraWhitespace ctermbg=none
" }}}

" Plugin Settings {{{
"" Airline
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#tab_nr_type = 0
let g:airline#extensions#tabline#buffer_idx_mode = 1
" map <leader>i to buffer i
for i in range(1,9)
    execute 'nmap <Leader>'.i.' <Plug>AirlineSelectTab'.i.'<CR>'
endfor
""  Nerdcommenter
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'
let g:NERDAltDelims_java = 1
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1
"" NerdTree
nnoremap <F2> :NERDTreeToggle <CR>
"" MRU
nnoremap <S-r> :MRU <CR>
"" NerdCommenter
nnoremap <S-c> :call NERDComment(0,"toggle")<CR>
vnoremap <S-c> :call NERDComment(0,"toggle")<CR>
" }}}

" Remappings {{{
"" Main
let mapleader = "\<Space>"  " set <Space> as leader key
nnoremap ; :
vmap ; :
nmap <silent> <leader>/ :nohlsearch<CR>
noremap <S-s> :w <CR>
nnoremap <F5> :so $MYVIMRC <CR>
map <silent> <F11> :call system("wmctrl -ir " . v:windowid . " -b toggle,fullscreen") <CR>
nnoremap <Leader>c :e ~/.vimrc <CR>
nnoremap <S-h> :noh <CR>

"" Copy Operations
nnoremap <Leader>p "+p <CR>
nnoremap cp :let @+=expand('%:p:h') <CR>
nnoremap <C-a> :%y+ <CR>
" copy paste in buffers
vmap <C-c> :w! ~/.vimbuffer<CR>
nmap <C-c> :.w! ~/.vimbuffer<CR>
map <C-p> :r ~/.vimbuffer<CR>

"" Navigations
nnoremap <S-a> :bp <CR>
nnoremap <S-d> :bn <CR>
nnoremap <Leader>w <C-W>k <CR>
nnoremap <Leader>s <C-W>j <CR>
nnoremap <Leader>a <C-W>h <CR>
nnoremap <Leader>d <C-W>l <CR>

"" Window Operations
" map vertical and horizontal split to <leader> h,v
nnoremap <Leader>h :vs <CR>
nnoremap <Leader>v :sv <CR>
nnoremap <S-q> :q <CR>
nnoremap <S-x> :bw <CR>

"" Misc
nnoremap + <C-a>
nnoremap - <C-x>
nnoremap <S-Down> :m +1<CR>
nnoremap <S-Up> :m .-2<CR>
nnoremap <C-d> :t.<CR>
set timeout ttimeoutlen=50
nnoremap <Leader>t :%s/\t/    /g <CR>
" }}}

" custom commands {{{
command! -nargs=1 Restore execute "source ~/.vim/sessions/"+<q-args>
command! Norel execute ":set number norelativenumber"
" }}}

" Abbreviations {{{
:ab py_mod import numpy as np<CR>import matplotlib.pyplot as plt<CR>from tqdm import tqdm
:ab py_os import os<CR>from glob import glob
:ab py_mat from scipy.io import loadmat,savemat
:ab py_main if __name__=='__main__':
" }}}

" Notes {{{
" 1. Swapped Esc and Capslock keys using Gnome tweak tool
" }}}
