""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGINS SETTINGS
"""""""""""""""""""""""""""""""""""""""""""""""""""
function! SetupVSnip() abort
    packadd! vim-vsnip
    imap <expr> <c-j>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<c-j>'
    smap <expr> <c-j>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<c-j>'
    imap <expr> <c-k> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<c-k>'
    smap <expr> <c-k> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'   : <c-k>

    let g:vsnip_snippet_dir = expand("~/.config/nvim/snippets")
endfunction

function! SetupUltisnips() abort
    packadd! ultisnips
    packadd! vim-snippets
    let g:UltiSnipsExpandTrigger="<tab>"
    let g:UltiSnipsExpandTrigger="<c-s>"
    let g:UltiSnipsJumpForwardTrigger="<c-j>"
    let g:UltiSnipsJumpBackwardTrigger="<c-k>"
    let g:UltiSnipsEditSplit="vertical"
endfunction

function! SetupFzf() abort
    packadd! fzf.vim
    let g:fzf_layout = { 'down': '~40%' }
endfunction

function! SetupCompletion() abort
    packadd! completion-nvim
    let g:completion_enable_snippet = 'vim-vsnips'

    inoremap <expr> <tab> pumvisible() ? "\<C-n>" : "\<tab>"
    inoremap <expr> <s-tab> pumvisible() ? "\<C-p>" : "\<s-tab>"
    autocmd BufEnter * lua require'completion'.on_attach()
endfunction

if exists('$TMUX')
    packadd! vim-tmux-navigator
endif

call SetupFzf()
call SetupVSnip()
call SetupCompletion()
