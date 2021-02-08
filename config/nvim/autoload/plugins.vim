""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGINS SETTINGS
"""""""""""""""""""""""""""""""""""""""""""""""""""
function! plugins#SetupVSnip() abort
    packadd! vim-vsnip
    imap <expr> <c-j>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<c-j>'
    smap <expr> <c-j>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<c-j>'
    imap <expr> <c-k> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<c-k>'
    smap <expr> <c-k> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'   : <c-k>

    let g:vsnip_filetypes = {}
    let g:vsnip_filetypes.cpp = ['c']
    let g:vsnip_snippet_dir = expand("~/.config/nvim/snippets")
endfunction

function! plugins#SetupUltisnips() abort
    packadd! ultisnips
    packadd! vim-snippets
    let g:UltiSnipsExpandTrigger="<tab>"
    let g:UltiSnipsExpandTrigger="<c-s>"
    let g:UltiSnipsJumpForwardTrigger="<c-j>"
    let g:UltiSnipsJumpBackwardTrigger="<c-k>"
    let g:UltiSnipsEditSplit="vertical"
endfunction

function! plugins#SetupFzf() abort
    packadd! fzf.vim
    let g:fzf_layout = { 'down': '~40%' }
endfunction

function! plugins#SetupCompletion() abort
    packadd! completion-nvim
    let g:completion_enable_snippet = 'vim-vsnip'

    inoremap <expr> <tab> pumvisible() ? "\<C-n>" : "\<tab>"
    inoremap <expr> <s-tab> pumvisible() ? "\<C-p>" : "\<s-tab>"
    autocmd BufEnter * lua require'completion'.on_attach()
endfunction

function! plugins#SetupCompe() abort
    packadd! nvim-compe

    let g:compe = {}
    let g:compe.enabled = v:true
    let g:compe.autocomplete = v:true
    let g:compe.debug = v:false
    let g:compe.min_length = 1
    let g:compe.preselect = 'enable'
    let g:compe.throttle_time = 80
    let g:compe.source_timeout = 200
    let g:compe.incomplete_delay = 400
    let g:compe.max_abbr_width = 100
    let g:compe.max_kind_width = 100
    let g:compe.max_menu_width = 100
    let g:compe.documentation = v:true

    let g:compe.source = {}
    let g:compe.source.path = v:true
    let g:compe.source.buffer = v:false
    let g:compe.source.calc = v:false
    let g:compe.source.vsnip = v:true
    let g:compe.source.nvim_lsp = v:true
    let g:compe.source.nvim_lua = v:true
    let g:compe.source.spell = v:true
    let g:compe.source.tags = v:true
    let g:compe.source.snippets_nvim = v:false
    let g:compe.source.treesitter = v:false

    inoremap <silent><expr> <CR>      compe#confirm('<CR>')
    inoremap <silent><expr> <tab> pumvisible() ? "\<C-n>" : "\<TAB>"
    inoremap <expr><s-tab> pumvisible() ? "\<C-p>" : "\<C-h>"
endfunction
