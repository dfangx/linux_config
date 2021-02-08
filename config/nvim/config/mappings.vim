""""""""""""""""""""""""""""""""""""""""""""""""""
" KEYBINDS
""""""""""""""""""""""""""""""""""""""""""""""""""
" Leader keys
nnoremap <Space> <NOP>
let mapleader=" "
let maplocalleader=" "

" File finding
nnoremap <leader>ff :Files<cr>
nnoremap <leader>fs :sfind 
nnoremap <leader>fv :vert :sfind 
nnoremap <leader>ft :tabfind 

" Split lines
nnoremap S a<cr><esc>
nnoremap <leader>O O<esc>
nnoremap <leader>o o<esc>

" Buffer management
nnoremap <leader>] :bn<cr>
nnoremap <leader>[ :bp<cr>
nnoremap <leader>b :Buffers<cr>
nnoremap <leader>d :bd<cr>

" Surround
inoremap ( ()<left>
inoremap (; ();<left><left>
inoremap ) ()
inoremap [ []<left>
inoremap [; [];<left><left>
inoremap ] []
inoremap {<cr> {<cr>}<esc>O
inoremap {;<cr> {<cr>};<esc>O
inoremap < <><left>
inoremap > <>
inoremap " ""<left>
inoremap ' ''<left>

" Surround highlighted with token
vnoremap <leader>" <esc>`>a"<esc>`<i"<esc>
vnoremap <leader>' <esc>`>a'<esc>`<i'<esc>
vnoremap <leader>( <esc>`>a)<esc>`<i(<esc>
vnoremap <leader>[ <esc>`>a]<esc>`<i[<esc>
vnoremap <leader>{ <esc>`>a}<esc>`<i{<esc>
vnoremap <leader>< <esc>`>a><esc>`<i<<esc>

" Move pane
nnoremap <silent> <leader>h <c-w>H
nnoremap <silent> <leader>l <c-w>L
nnoremap <silent> <leader>k <c-w>K
nnoremap <silent> <leader>j <c-w>J

" Split window
nnoremap <leader>s <c-w>s
nnoremap <leader>v <c-w>v
 
" Resize window
nnoremap <silent> <leader>< 10<c-w><
nnoremap <silent> <leader>> 10<c-w>>
nnoremap <silent> <leader>+ 10<c-w>+
nnoremap <silent> <leader>- 10<c-w>-

" Move between windows
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l
nnoremap <c-h> <c-w>h

" Notes mappings
command! -bang NotesSel call fzf#vim#files("~/documents/notes", {"options": ["--query=index.md", "--preview", "cat {}"]}, <bang>0) 
command! -nargs=1 NewNote :execute ":e" "~/documents/notes/" . strftime("%Y%m%d%H%M%S") . "-<args>.md"
nnoremap <leader>ws :NotesSel<cr>
nnoremap <leader>ww :e ~/documents/notes/index.md<cr>
nnoremap <leader>/ :Rg<cr>
nnoremap <leader>wn :NewNote 
nnoremap <silent> <c-]> :call fzf_tags#GetTags()<cr>
inoremap <expr> <c-x><c-f> fzf#vim#complete#path("fd", {"options":["--select-1", "--preview", "tree {}"]})
imap <c-x><c-l> <plug>(fzf-complete-line)
imap <c-x><c-k> <plug>(fzf-complete-word)
