if exists('$TMUX')
    packadd! vim-tmux-navigator
endif

if has('nvim')
    call plugins#SetupCompe()
    call plugins#SetupNvimLsp()
    call plugins#SetupTreesitter()
else
    call plugins#SetupVimLsp()
    call plugins#SetupAsyncComplete()
    call plugins#SetupVSnipInteg()
end

call plugins#SetupFzf()
call plugins#SetupVSnip()
