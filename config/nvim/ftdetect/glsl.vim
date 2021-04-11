augroup detectGLSLFiletype
    autocmd!
    autocmd! BufNewFile,BufRead,BufWritePost *.vs,*.fs,*.vert,*.frag setlocal ft=glsl
augroup END
