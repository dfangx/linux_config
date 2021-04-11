function! s:CheckoutBranch(sel) abort
    if a:sel[0] == '*'
        return
    endif
    let l:sel = trim(a:sel, ' ', 0)
    let l:msg = system('git checkout' . a:sel)
    if l:msg =~ 'Switched to branch'
        call GetGitBranch()
        echo 'Switched to branch' . a:sel
    else
        echo 'You have uncommitted changes. Failed to checkout' . a:sel
    endif
endfunction

function! git#GitStatus() abort
    echo system('git status')
endfunction

function! git#GitCheckout() abort
    echo fzf#run(fzf#wrap({'source': 'git branch', 'sink': function('s:CheckoutBranch')}))
endfunction


function! git#GetGitBranch() abort
    let s:branch = system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! s:GetGitNumStaged() abort
    let s:numStaged = system('git diff --cached --numstat | wc -l | tr -d "\n"')
endfunction

function! s:GetGitNumModified() abort
    let s:numModified = system('git ls-files -m --exclude-standard $(git rev-parse --show-toplevel) | wc -l | tr -d "\n"') 
endfunction

function! s:GetGitNumUntracked() abort
    let s:numUntracked = system('git ls-files -o --exclude-standard $(git rev-parse --show-toplevel) | wc -l | tr -d "\n"') 
endfunction

function! git#GetGitFileNumbers() abort
    if s:isRepo
        call s:GetGitNumStaged()
        call s:GetGitNumModified()
        call s:GetGitNumUntracked()
    endif
endfunction

function! git#IsGitRepo() abort
    let s:isRepo = system("git rev-parse --is-inside-work-tree | tr -d '\n'") == 'true'
    if s:isRepo
        return 1
    else
        return 0
    endif
endfunction


function! git#StatusGitBranch() abort
    if strlen(s:branch) > 0
        return ' ' . s:branch
    else
        return ''
    endif
endfunction

function! git#StatusGitNumModified() abort
    return s:numModified
endfunction

function! git#StatusGitNumStaged() abort
    return s:numStaged
endfunction

function! git#StatusGitNumUntracked() abort
    return s:numUntracked
endfunction
