let $FZF_DEFAULT_OPTS='--tac --reverse'
nnoremap <C-p> :GFiles<CR>
nnoremap <leader><C-p> :Files<CR>
augroup FZF_GROUP
    autocmd! FileType fzf tnoremap <buffer> <Esc> <C-c>
augroup END
