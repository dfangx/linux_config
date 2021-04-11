if !filereadable("Makefile")
    setlocal makeprg=g++\ -o\ %<\ %\ -Wall
endif
"lua require'treesitter/cpp'
"packadd! vim-cpp-modern
