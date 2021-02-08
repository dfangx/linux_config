""""""""""""""""""""""""""""""""""""""""""""""""""""
" FUNCTIONS
""""""""""""""""""""""""""""""""""""""""""""""""""""
function! Eatchar(pat)
    let c = nr2char(getchar(0))
    return (c =~ a:pat) ? '' : c
endfunction

"function! GitNumModified()
"    let l:numStage = system('git ls-files -om --exclude-standard $(git rev-parse --show-toplevel) | wc -l | tr -d "\n"') 
"    return l:numStage
"endfunction
"
"function! GitNumStaged()
"    let l:numStaged = system('git diff --cached --numstat | wc -l | tr -d "\n"')
"    return l:numStaged
"endfunction

function! BracketToCurly(bracket)
    if a:bracket == '('
        return 'm1f)m2%r{`2r}`1'
    elseif a:bracket == ')'
        return 'm1F(m2%r}`2r{`1'
    else
        return ''
    endif
endfunction

function! CurlyToBracket(bracket)
    if a:bracket == '{'
        return 'm1f}m2%r(`2r)`1'
    elseif a:bracket == '}'
        return 'm1F{m2%r)`2r(`1'
    else
        return ''
    endif
endfunction

function! CreateZetNote(name) abort
    return strftime("%Y%m%d%H%M%S") . "-" . name ".md"
endfunction
