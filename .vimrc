" ========================
"  PLUGINS USING VIM-PLUG
" ========================

call plug#begin()

" Helpful stuff
Plug 'jiangmiao/auto-pairs'
Plug 'preservim/nerdcommenter'
Plug 'vimwiki/vimwiki'

" Appearance
Plug 'vim-airline/vim-airline'
Plug 'morhetz/gruvbox'

" Language stuff
Plug 'neoclide/coc.nvim'
Plug 'rust-lang/rust.vim'
Plug 'cespare/vim-toml'
Plug 'vim-syntastic/syntastic'

" File navigating stuff
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-rooter'

call plug#end()

filetype plugin indent on

" ============
"  APPEARANCE
" ============

syntax on

" 24 bit colour support:
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

" Set gruvbox colorscheme
autocmd vimenter * ++nested colorscheme gruvbox

" Set current line highlighting only when in insert mode
autocmd InsertEnter,InsertLeave * set cul!

set background=dark
set nu
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
set splitright
set splitbelow
set incsearch
set hlsearch
set shell=/bin/fish
set clipboard+=unnamedplus

let mapleader=" "

" ==========
"  KEYBINDS
" ==========

nnoremap <Tab> @q
nnoremap <Bslash> :noh<CR>
nnoremap <bs> <C-o>
" Open explorer
nnoremap <M-f> :Explore<CR>
" Open term in new tab
nnoremap <M-t> :tabnew<CR>:term<CR>
" Create new empty splits
nnoremap <leader>N :new<CR>
nnoremap <leader>M :vnew<CR>
" Create new splits and open GFiles
nnoremap <leader>n :new<CR>:GFiles<CR>
nnoremap <leader>m :vnew<CR>:GFiles<CR>
" Create new terminal splits
nnoremap <leader><C-n> :new<CR>:term<CR>
nnoremap <leader><C-m> :vnew<CR>:term<CR>
" Comment out in insert, normal, and visual using CTRL-/
noremap <C-_> :call NERDComment(0, "toggle")<CR>
inoremap <C-_> <C-o>:call NERDComment(0, "toggle")<CR>
" Paste in insert mode using CTRL-V
inoremap <C-v> <C-o>P
" Completion navigation
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
nmap <silent> <leader>gd <Plug>(coc-definition)
nmap <silent> <leader>gy <Plug>(coc-type-definition)
nmap <silent> <leader>gi <Plug>(coc-implementation)
nmap <silent> <leader>gr <Plug>(coc-references)
" Split navigation using leader key
nnoremap <leader>h <C-W>h
nnoremap <leader>j <C-W>j
nnoremap <leader>k <C-W>k
nnoremap <leader>l <C-W>l
nnoremap <C-p> :GFiles<CR>
nnoremap <C-f> :Rg<CR>
" Show documentation for function using coc.nvim
nnoremap <silent> <leader>gk :call <SID>show_documentation()<CR>
nnoremap <C-b> :make<CR>
" Scrolling
noremap <C-j> <C-e>
noremap <C-k> <C-y>
inoremap <C-j> <C-o><C-e>
inoremap <C-k> <C-o><C-y>
" Don't copt when pressing 'x' in normal mode
nnoremap x "_x

" Close fzf using Esc
autocmd! FileType fzf tnoremap <buffer> <Esc> <C-c>

" Show documentation for a function using CoC
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" ===============
"  MISCELLANEOUS
" ===============

" Netrw
let g:netrw_banner=0
let g:netrw_liststyle=3
augroup netrw_settings
    " Close netrw using <bs>
    autocmd FileType netrw nnoremap <buffer><silent> <bs> :call <SID>CloseNetrw()<CR>
    function! s:CloseNetrw() abort
      for bufn in range(1, bufnr('$'))
        if bufexists(bufn) && getbufvar(bufn, '&filetype') ==# 'netrw'
          silent! execute 'bwipeout ' . bufn
          if getline(2) =~# '^" Netrw '
            silent! bwipeout
          endif
          return
        endif
      endfor
    endfunction
augroup END

" Rust
let g:rustfmt_autosave = 1
autocmd Filetype rust setlocal colorcolumn=100 makeprg=cargo\ build

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
