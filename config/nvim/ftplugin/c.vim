if &ft != 'c'
    finish
endif

if !filereadable("Makefile")
    setlocal makeprg=gcc\ -o\ %<\ %\ -Wall
endif
