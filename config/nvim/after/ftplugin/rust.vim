"let g:racer_cmd="$HOME/.cargo/bin/racer"
"let g:racer_experimental_completer=1
"let g:racer_insert_paren=1

let s:loaded = get(s:, 'loaded', v:false)
if !s:loaded
    " lua require'treesitter/rust'
    lua require'lsp/rust'
    let s:loaded = v:true
    doautocmd FileType rust
endif

compiler rust
"autocmd CursorMoved,InsertLeave,BufEnter,BufWinEnter,TabEnter,BufWritePost * lua require'lsp_extensions'.inlay_hints{ prefix = '', highlight = "Comment" }
augroup rustFmt
    au!
    autocmd BufWritePre *.rs lua vim.lsp.buf.formatting_sync(nil, 1000)
augroup end
"augroup rustWrite 
"    au!
"    autocmd BufWritePost *.rs !cargo fmt
"augroup end
"packadd! vim-racer
"packadd! vim-rust-syntax-ext
