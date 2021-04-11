call plugins#SetupRacer()
setlocal makeprg=cargo\ build
" lua require'treesitter/rust'
augroup rustFmt
    au!
    autocmd BufWritePre *.rs silent! !rustfmt
augroup end
