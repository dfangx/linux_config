function! notes#CreateNote(dir) abort
    execute 'e' g:notes_home . '/' . a:dir . '/' . strftime("%Y%m%d%H%M%S") . ".md"
endfunction

function! notes#SearchNotes(query, fullscreen) abort
    function! Open(sel) abort
        let l:list = filter(flatten(map(a:sel, 'split(v:val, ":")')), 'filereadable(v:val)')
        for f in l:list
            execute 'e' f
        endfor
    endfunction
    let cmd = 'rg --no-heading --smart-case --line-number --column --color=always -- %s ' . g:notes_home . ' || true'

    let initial = printf(cmd, shellescape(a:query))
    let spec = { 
                \ 'options': [ 
                    \ '--multi',
                    \ '--ansi',
                    \ '--query', a:query,
                    \ '--delimiter', ':',
                    \ '--prompt', 'Search Notes> ',
                    \ '--preview-window', 'up,60%,+{2}+3/3'
                    \ ],
                \ }
    call fzf#vim#grep(initial, 0, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

function! notes#SearchNotesByTag(query, fullscreen) abort
    function! TagFilter(fullscreen, sel) abort
        let tags=join(a:sel, '|') 
        let files=system('rg --no-heading --smart-case --line-number --column --color=never -lw "' . tags . '" '. g:notes_home)
        if len(files) == 1
            execute 'e' files[0]
        endif
        let cmd = 'rg --no-heading --smart-case --line-number --column --color=always -H -- "" ' . substitute(files, '\n', ' ', 'g') . ' || true'
        let initial = cmd
        let spec = { 
                    \ 'options': [ 
                    \ '--multi',
                    \ '--ansi',
                    \ '--delimiter', ':',
                    \ '--prompt', 'Search Notes> ',
                    \ '--preview-window', 'up,60%,+{2}+3/3'
                    \ ],
                    \ }
        call fzf#vim#grep(initial, 0, fzf#vim#with_preview(spec), a:fullscreen)
    endfunction

    function! Open(sel) abort
        let l:list = filter(flatten(map(a:sel, 'split(v:val, ":")')), 'filereadable(v:val)')
        for f in l:list
            execute 'e' f
        endfor
    endfunction

    let cmd = 'rg -r ''$1'' --no-heading -Io -- "tags:(.*\w+)" ' . g:notes_home . ' | sed "s/ /\n/g" | sort -u | sed "/^$/d" || true'
    let initial = cmd
    if a:query != ""
        cmd = 'rg --no-heading -Io -- "#"%s ' . g:notes_home . ' | sort -u || true'
        initial = printf(cmd, shellescape(a:query))
    endif
    let spec = { 
                \ 'source': initial,
                \ 'sink*': function('TagFilter', [a:fullscreen]),
                \ 'options': [ 
                    \ '--multi',
                    \ '--ansi',
                    \ '--query', a:query,
                    \ '--delimiter', ':',
                    \ '--prompt', 'Tag Search> ',
                    \ ]
                \ }
    call fzf#run(fzf#wrap(spec), a:fullscreen)
endfunction

function! notes#LinkNote() abort
    function! GetFileName(sel)
        let link = '[](' . split(a:sel, ':')[0] . ')'
        let current_line = getline('.')
        call setline('.', current_line . link)
        call feedkeys('f]i', 'n')
    endfunction

    let cmd = 'rg --smart-case --color=always --no-heading --line-number -- "" ' . g:notes_home
    call fzf#vim#grep(cmd, 0, {'sink': function('GetFileName')}, 0)
endfunction

