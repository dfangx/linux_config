if has('nvim')
    augroup treesitter
        autocmd!
        autocmd FileType rust,c,cpp,python,yaml,bash,sh,lua call SetupTreesitterNord()
    augroup END

    augroup lsp
        autocmd!
        autocmd BufWrite,BufEnter,InsertLeave * :lua vim.lsp.diagnostic.set_loclist({open_loclist = false})
    augroup END
endif


augroup vimStart
    autocmd!
    autocmd VimResized * wincmd =
augroup END

