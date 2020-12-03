function! fzf_tags#GetTags()
    let l:tagid = expand("<cword>")
    let s:taglist = map(taglist("^" . l:tagid . "$", expand("%:p")), function("s:TagToString"))
    echo s:taglist
    if len(s:taglist) == 0
        echohl WarningMsg
        echo "Tag not found: " . l:tagid
        echohl None
    elseif len(s:taglist) == 1
        execute "tag" l:tagid
    else
        call fzf#run({"source": s:taglist, "sink": function("s:TagSink", [l:tagid]), "options": "--tiebreak index --header-lines 1 --prompt '" . l:tagid . "> '"})
    endif
endfunction

function! s:TagToString(key, value)
    return  (a:key + 1) .  "   " . a:value["filename"] . "   " . a:value["cmd"]
endfunction

function! s:TagSink(tag, sel)
    let l:count = split(a:sel)[0]
    execute l:count  . "tag" a:tag
endfunction
