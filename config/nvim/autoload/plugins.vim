""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGINS SETTINGS
"""""""""""""""""""""""""""""""""""""""""""""""""""
function! plugins#SetupVSnip() abort
    packadd! vim-vsnip
    imap <expr> <c-j> vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<c-j>'
    smap <expr> <c-j> vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<c-j>'
    imap <expr> <c-k> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<c-k>'
    smap <expr> <c-k> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<c-k>'

    let g:vsnip_filetypes = {}
    let g:vsnip_filetypes.cpp = ['c']
    let g:vsnip_snippet_dir = expand("~/.config/nvim/snippets/vsnip")
endfunction

function! plugins#SetupUltisnips() abort
    packadd! ultisnips
    packadd! vim-snippets
    let g:UltiSnipsExpandTrigger="<tab>"
    let g:UltiSnipsExpandTrigger="<c-s>"
    let g:UltiSnipsJumpForwardTrigger="<c-j>"
    let g:UltiSnipsJumpBackwardTrigger="<c-k>"
    let g:UltiSnipsEditSplit="vertical"
    let g:UltiSnipsSnippetDirectories = ["snippets/ultisnips"]
endfunction

function! plugins#SetupFzf() abort
    let g:fzf_colors =
                \ { 'fg':      ['fg', 'Normal'],
                \ 'bg':      ['bg', 'Normal'],
                \ 'hl':      ['fg', 'Comment'],
                \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
                \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
                \ 'hl+':     ['fg', 'Statement'],
                \ 'info':    ['fg', 'PreProc'],
                \ 'border':  ['fg', 'Ignore'],
                \ 'prompt':  ['fg', 'Conditional'],
                \ 'pointer': ['fg', 'Exception'],
                \ 'marker':  ['fg', 'Keyword'],
                \ 'spinner': ['fg', 'Label'],
                \ 'header':  ['fg', 'Comment'] }
    let g:fzf_layout = { 'down': '~40%' }

    nnoremap <leader>ff :Files<cr>
    nnoremap <leader>fs :call fzf#run(fzf#wrap({'sink': 'split'}))<cr>
    nnoremap <leader>fv :call fzf#run(fzf#wrap({'sink': 'vert split'}))<cr>
    nnoremap <leader>ft :call fzf#run(fzf#wrap({'sink': 'tabedit'}))<cr>
    nnoremap <leader>fg :GFiles<cr>
    nnoremap <leader>b :Buffers<cr>
    nnoremap <leader>/ :Rg<cr>
    nnoremap <silent> <c-]> :call fzf_tags#GetTags()<cr>
    inoremap <expr> <c-x><c-f> fzf#vim#complete#path("fd", {"options":["--select-1", "--preview", "tree {}"]})
    imap <c-x><c-l> <plug>(fzf-complete-line)
    imap <c-x><c-k> <plug>(fzf-complete-word)
endfunction

function! plugins#SetupCompletion() abort
    packadd! completion-nvim
    let g:completion_enable_snippet = 'vim-vsnip'
    lua require'completion'.addCompletionSource('racer', require'rust'.complete_item)
    lua require'completion'.addCompletionSource('vimtex', require'vimtex'.complete_item)
    let g:completion_chain_complete_list = {
                \ 'rust' : [
                \   {'complete_items': ['snippet', 'racer']},
                \   ],
                \ 'tex' : [
                \   {'complete_items': ['snippet', 'vimtex']}, 
                \   ],
                \ }

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
    let g:compe.source.vsnip = {}
    let g:compe.source.vsnip.priority = 10
    let g:compe.source.nvim_lsp = {}
    let g:compe.source.nvim_lsp.priority = 9
    " let g:compe.source.omni = {}
    " let g:compe.source.omni.priority = 9
    let g:compe.source.tags = {}
    let g:compe.source.tags.priority = 8
    let g:compe.source.buffer = {}
    let g:compe.source.buffer.priority = 1
    let g:compe.source.calc = v:true
    let g:compe.source.nvim_lua = v:true

    inoremap <silent><expr> <CR>    compe#confirm('<CR>')
    inoremap <silent><expr> <tab>   pumvisible() ? "\<C-n>" : "\<TAB>"
    inoremap <expr><s-tab>          pumvisible() ? "\<C-p>" : "\<C-h>"
endfunction

function! plugins#SetupRacer() abort
    if system("pgrep rust-analyzer")
        return
    endif

    let g:racer_experimental_completer = 1
    let g:racer_insert_paren = 1

    nmap <buffer> gd         <Plug>(rust-def)
    nmap <buffer> gs         <Plug>(rust-def-split)
    nmap <buffer> gx         <Plug>(rust-def-vertical)
    nmap <buffer> gt         <Plug>(rust-def-tab)
    nmap <buffer> <leader>gd <Plug>(rust-doc)
    nmap <buffer> <leader>gD <Plug>(rust-doc-tab)
endfunction

function! plugins#SetupVimtex() abort
    let g:vimtex_view_method='zathura'
    let g:vimtex_quickfix_mode=0
    let g:vimtex_format_enabled = 1
endfunction

function! plugins#SetupMuComplete() abort
    packadd! vim-mucomplete
    let g:mucomplete#enable_auto_at_startup = 1
    let g:mucomplete#chains = {
                \ 'default' : ['omni'],
                \ }

    inoremap <silent> <plug>(MUcompleteFwdKey) <right>
    imap <right> <plug>(MUcompleteCycFwd)
    inoremap <silent> <plug>(MUcompleteBwdKey) <left>
    imap <left> <plug>(MUcompleteCycBwd)
endfunction

function! plugins#SetupNvimLsp() abort
    packadd! nvim-lspconfig
    lua require'lsp/setup'
endfunction

function! plugins#SetupTreesitter() abort
    packadd! nvim-treesitter
    lua require'treesitter/treesitter'
endfunction

function! plugins#SetupVimLsp() abort
    packadd! vim-lsp
    if executable('pyright')
        au User lsp_setup call lsp#register_server({
                    \ 'name': 'pyright',
                    \ 'cmd': {server_info->['pyright']},
                    \ 'allowlist': ['python'],
                    \ })
    endif

    if executable('rust-analyzer')
        au User lsp_setup call lsp#register_server({
                    \ 'name': 'rust-analyzer',
                    \ 'cmd': {server_info->['rust-analyzer']},
                    \ 'allowlist': ['rust'],
                    \ })
    endif

    if executable('clangd')
        au User lsp_setup call lsp#register_server({
                    \ 'name': 'clangd',
                    \ 'cmd': {server_info->['clangd']},
                    \ 'allowlist': ['c', 'cpp'],
                    \ })
    endif

    function! s:on_lsp_buffer_enabled() abort
        setlocal omnifunc=lsp#complete
        setlocal signcolumn=yes
        if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
        nmap <buffer> gd <plug>(lsp-definition)
        nmap <buffer> gs <plug>(lsp-document-symbol-search)
        nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
        nmap <buffer> gr <plug>(lsp-references)
        nmap <buffer> gi <plug>(lsp-implementation)
        nmap <buffer> gt <plug>(lsp-type-definition)
        nmap <buffer> <leader>rn <plug>(lsp-rename)
        nmap <buffer> [g <plug>(lsp-previous-diagnostic)
        nmap <buffer> ]g <plug>(lsp-next-diagnostic)
        nmap <buffer> K <plug>(lsp-hover)
        inoremap <buffer> <expr><c-f> lsp#scroll(+4)
        inoremap <buffer> <expr><c-d> lsp#scroll(-4)

        let g:lsp_format_sync_timeout = 1000
        autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')
    endfunction

    augroup lsp_install
        au!
        " call s:on_lsp_buffer_enabled only for languages that has the server registered.
        autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
    augroup END
endfunction

function! plugins#SetupAsyncComplete() abort
    packadd! asyncomplete.vim
    packadd! asyncomplete-lsp.vim

    inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
    inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
    inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"
endfunction

function! plugins#SetupVSnipInteg() abort
    packadd! vim-vsnip-integ
endfunction
