command! -bang -nargs=? -complete=dir SearchNotes call notes#SearchNotes(<q-args>, <bang>1)
command! -bang -nargs=? -complete=dir SearchNotesByTag call notes#SearchNotesByTag(<q-args>, <bang>1)
command! -bang -nargs=? -complete=dir NewNote call notes#CreateNote(<q-args>)
command! -nargs=0 LinkNote call notes#LinkNote()
