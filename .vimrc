call plug#begin()
Plug 'rakr/vim-one'
Plug 'vimwiki/vimwiki'
Plug 'jiangmiao/auto-pairs'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Plug 'Valloric/YouCompleteMe'
call plug#end()

" 24 bit colour support:
execute "set t_8f=\e[38;2;%lu;%lu;%lum"
execute "set t_8b=\e[48;2;%lu;%lu;%lum"
if (empty($TMUX))
    if (has("nvim"))
        let $NVIM_TUI_ENABLE_TRUE_COLOR=1
    endif
    if (has("termguicolors"))
        set termguicolors
    endif
endif

set nu
colorscheme one
set background=dark
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
set nocompatible
filetype plugin on
syntax on
:nnoremap <Space> @q

