" ========================
"  PLUGINS USING VIM-PLUG
" ========================

call plug#begin()

" Helpful stuff
Plug 'jiangmiao/auto-pairs'
Plug 'preservim/nerdcommenter'
Plug 'vimwiki/vimwiki'

" Appearance
Plug 'itchyny/lightline.vim'
Plug 'morhetz/gruvbox'
Plug 'joshdick/onedark.vim'

" Language stuff
Plug 'neoclide/coc.nvim'
Plug 'mxw/vim-jsx'

" File navigating stuff
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-rooter'
Plug 'tpope/vim-fugitive'

call plug#end()

let mapleader="\<Space>"

source $HOME/.config/nvim/plug-config/coc.vim
source $HOME/.config/nvim/plug-config/fzf.vim
source $HOME/.config/nvim/plug-config/lightline.vim

filetype plugin indent on

" ============
"  APPEARANCE
" ============

syntax on

" Colours
if (has("termguicolors"))
    set termguicolors
endif

if (has("autocmd") && !has("gui_running"))
  augroup colorset
    autocmd!
    let s:white = { "gui": "#ABB2BF", "cterm": "145", "cterm16" : "7" }
    autocmd ColorScheme * call onedark#set_highlight("Normal", { "fg": s:white }) " `bg` will not be styled since there is no `bg` setting
  augroup END
endif

hi Comment cterm=italic
let g:onedark_hide_endofbuffer=1
let g:onedark_terminal_italics=1
let g:onedark_termcolors=256

colorscheme onedark
set background=dark

" ==========
"  SETTINGS
" ==========

set nu 
set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab 
set splitright splitbelow
set incsearch hlsearch 
set clipboard+=unnamedplus 
set scrolloff=8 
set shell=/bin/bash 
set foldnestmax=1 foldmethod=indent foldlevel=1 
set lbr 
set noswapfile noshowmode

" Netrw
let g:netrw_banner=0
let g:netrw_liststyle=3

" ==========
"  KEYBINDS
" ==========

nnoremap <M-f> :e .<CR>
nnoremap <leader>qq @q
nnoremap <leader><BSlash> :noh<CR>
" Open term in new tab
nnoremap <leader>tt :tabnew<CR>:term<CR>
" Create new empty splits
nnoremap <leader>n :new<CR>
nnoremap <leader>m :vnew<CR>
" Create new terminal splits
nnoremap <leader><C-n> :new<CR>:term<CR>
nnoremap <leader><C-m> :vnew<CR>:term<CR>
" Comment out in insert, normal, and visual using CTRL-/
noremap <C-_> :call NERDComment(0, "toggle")<CR>
inoremap <C-_> <C-o>:call NERDComment(0, "toggle")<CR>
" Split navigation using leader key
nnoremap <leader>h <C-W>h
nnoremap <leader>j <C-W>j
nnoremap <leader>k <C-W>k
nnoremap <leader>l <C-W>l
nnoremap <leader>H <C-W>H
nnoremap <leader>J <C-W>J
nnoremap <leader>K <C-W>K
nnoremap <leader>L <C-W>L
" Scrolling
noremap <C-j> <C-e>
noremap <C-k> <C-y>
inoremap <C-j> <C-o><C-e>
inoremap <C-k> <C-o><C-y>
" Don't copy when pressing 'x' in normal mode
nnoremap x "_x

" ===========
"  AUTOGROUP
" ===========

augroup AUTOGROUP
    " Clear all autocommands
    autocmd!

    " Set current line highlighting only when in insert mode
    autocmd InsertEnter,InsertLeave * set cul!

    " Tab size
    autocmd Filetype rust setlocal tabstop=4 shiftwidth=4
    autocmd Filetype javascript setlocal tabstop=2 shiftwidth=2
    autocmd Filetype typescript setlocal tabstop=2 shiftwidth=2
augroup END


" =================
"  NEOVIM SPECIFIC
" =================

if has("nvim")
    tnoremap <Esc> <C-\><C-n>
    augroup neovim_terminal
        autocmd!
        " Enter Terminal-mode (insert) automatically
        autocmd TermOpen * startinsert
        " Disables number lines on terminal buffers
        autocmd TermOpen * :set nonumber norelativenumber
        " allows you to use Ctrl-c on terminal window
        autocmd TermOpen * nnoremap <buffer> <C-c> i<C-c>
    augroup END
    set mouse=a
else
    set nocompatible
    set timeoutlen=500
    set noesckeys
endif
