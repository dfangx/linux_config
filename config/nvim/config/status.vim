""""""""""""""""""""""""""""""""""""""""""""""""""""
" FUNCTIONS
""""""""""""""""""""""""""""""""""""""""""""""""""""
function! IsReadOnly()
    if &readonly
        return ''
    else
        return ''
    endif
endfunction

function! GetMode()
    let l:m = mode()
    if l:m == 'i'
        return 'INSERT'
    elseif l:m == 'v' || l:m == 'V' || l:m == "\<C-V>"
        return 'VISUAL'
    elseif l:m == 'R'
        return 'REPLACE'
    else
        return 'NORMAL'
    endif
endfunction

function! GitBranch()
    let l:branch = system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
    if strlen(l:branch) > 0
        return ' ' . l:branch
    else
        return ''
    endif
endfunction

function! IsGitRepo()
    let l:isRepo = system("git rev-parse --is-inside-work-tree | tr -d '\n'")
    if l:isRepo == 'true'
        return 1
    else
        return 0
    endif
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""
" STATUS LINE
""""""""""""""""""""""""""""""""""""""""""""""""""""
set statusline=
set statusline+=%*
set statusline+=\ %{GetMode()}
set statusline+=\ 
set statusline+=%2*
"set statusline+=

if IsGitRepo()
    set statusline+=\ %{GitBranch()}
    "    set statusline+=\[
    "    set statusline+=M%{GitNumModified()}
    "    set statusline+=:
    "    set statusline+=S%{GitNumStaged()}
    "    set statusline+=\]
    set statusline+=\  
    set statusline+=%1*
    "    set statusline+=
    "set statusline+=\ 
endif

set statusline+=\ %n:
set statusline+=\ %f
set statusline+=\ %M
set statusline+=\ %{IsReadOnly()}
set statusline+=%=
set statusline+=\ %Y
set statusline+=\ 
"set statusline+=\ 
set statusline+=%2*
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\ \[%{&fileformat}\]
set statusline+=\ 
"set statusline+=\ 
set statusline+=%*
set statusline+=\ %p%%
set statusline+=\ \ %l:%c\ 
