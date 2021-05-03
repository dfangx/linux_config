""""""""""""""""""""""""""""""""""""""""""""""""""""
" FUNCTIONS
""""""""""""""""""""""""""""""""""""""""""""""""""""
function! fn#Eatchar(pat)
    let c = nr2char(getchar(0))
    return (c =~ a:pat) ? '' : c
endfunction


function! fn#BracketToCurly(bracket)
    if a:bracket == '('
        return 'm1f)m2%r{`2r}`1'
    elseif a:bracket == ')'
        return 'm1F(m2%r}`2r{`1'
    else
        return ''
    endif
endfunction

function! fn#CurlyToBracket(bracket)
    if a:bracket == '{'
        return 'm1f}m2%r(`2r)`1'
    elseif a:bracket == '}'
        return 'm1F{m2%r)`2r(`1'
    else
        return ''
    endif
endfunction
