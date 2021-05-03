function! s:get_metadata(...) abort
    return {
                \ 'priority': 6,
                \ 'menu': '[Note Tags]',
                \ 'dup': 0,
                \ }
endfunction

function! s:determine(context) abort
    return compe#helper#determine(a:context)
endfunction

function! s:complete(context) abort
    let cmd = 'rg -r ''$1'' --no-heading -Io -- "tags:(.*\w+)" ' . g:notes_home . ' | sed "s/ /\n/g" | sort -u | sed "/^$/d" || true'    
    let note_tags = split(system(cmd), '\n')
    let items = map(note_tags, "{'word' : v:val}")
    call a:context.callback({'items' : items})
endfunction

let s:source = {
\   'get_metadata': function('s:get_metadata'),
\   'determine': function('s:determine'),
\   'complete': function('s:complete'),
\ }

" Register your custom source.
call compe#register_source('note_tags', s:source)
