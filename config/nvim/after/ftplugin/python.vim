let s:loaded = get(s:, 'loaded', v:false)
if !s:loaded
    " lua require'treesitter/python'
    lua require'lsp/python'
    let s:loaded = v:true
    doautocmd FileType python
endif
" augroup pyFmt
"     au!
"     autocmd BufWritePre *.py lua vim.lsp.buf.formatting_sync(nil, 1000)
" augroup end
