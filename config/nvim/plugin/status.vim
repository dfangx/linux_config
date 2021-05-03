""""""""""""""""""""""""""""""""""""""""""""""""""""
" FUNCTIONS
""""""""""""""""""""""""""""""""""""""""""""""""""""
function! StatusGetMode() abort
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

function! StatusIsReadOnly()
    if &readonly
        return ''
    else
        return ''
    endif
endfunction

augroup GitInfo
    autocmd!
    autocmd BufEnter * call git#GetGitBranch()
    autocmd BufEnter,BufWritePost * call git#GetGitFileNumbers()
augroup end

""""""""""""""""""""""""""""""""""""""""""""""""""""
" STATUS LINE
""""""""""""""""""""""""""""""""""""""""""""""""""""
set statusline=
set statusline+=%*
set statusline+=\ %{StatusGetMode()}
set statusline+=\ 
set statusline+=%2*
"set statusline+=


if git#IsGitRepo()
    set statusline+=\ %{git#StatusGitBranch()}
    set statusline+=\ \[
    set statusline+=S%{git#StatusGitNumStaged()}
    "set statusline+=\ :
    set statusline+=\ M%{git#StatusGitNumModified()}
    set statusline+=\ U%{git#StatusGitNumUntracked()}
    set statusline+=\]
    set statusline+=\  
    set statusline+=%1*
    "    set statusline+=
    "set statusline+=\ 
endif

set statusline+=\ %n:
set statusline+=\ %f
set statusline+=\ %M
set statusline+=\ %{StatusIsReadOnly()}
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
