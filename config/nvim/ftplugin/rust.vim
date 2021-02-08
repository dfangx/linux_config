compiler rust
augroup rustFmt
    au!
    autocmd BufWritePre *.rs lua vim.lsp.buf.formatting_sync(nil, 1000)
augroup end
