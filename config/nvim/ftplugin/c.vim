if &ft != 'c'
    finish
endif

if !filereadable("Makefile")
    setlocal makeprg=gcc\ -o\ %<\ %\ -Wall
endif

" lua require'treesitter/c'

" let g:cpp_attributes_highlight = 1
" let g:cpp_member_highlight = 1
" packadd! vim-cpp-modern
