if !filereadable("Makefile")
    setlocal makeprg=g++\ -o\ %<\ %\ -Wall
endif

inoreabbrev class class <c-r>=placeholder<cr><cr>{<cr><c-r>=placeholder<cr><cr>};<esc>:<c-r>=searchph<cr><cr>cf><c-r>=Eatchar('\s')<cr>
inoreabbrev cout std::cout << ;<esc>i<c-r>=Eatchar('\s')<cr>
inoreabbrev endl << std::endl<c-r>=Eatchar('\s')<cr><esc>
inoreabbrev map std::map<<c-r>=placeholder<cr>, <c-r>=placeholder<cr>>;<esc>:<c-r>=searchph<cr><cr>cf><c-r>=Eatchar('\s')<cr>
