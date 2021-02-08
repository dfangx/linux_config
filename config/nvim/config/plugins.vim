if exists('$TMUX')
    packadd! vim-tmux-navigator
endif

call plugins#SetupFzf()
call plugins#SetupVSnip()
call plugins#SetupCompletion()
