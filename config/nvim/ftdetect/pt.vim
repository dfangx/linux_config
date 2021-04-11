augroup detectPascalFiletype
    autocmd!
    autocmd! BufNewFile,BufRead,BufWritePost *.pt setlocal filetype=pascal
augroup END
