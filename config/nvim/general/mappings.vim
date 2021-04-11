""""""""""""""""""""""""""""""""""""""""""""""""""
" KEYBINDS
""""""""""""""""""""""""""""""""""""""""""""""""""
" Leader keys
nnoremap <Space> <NOP>
let mapleader=" "
let maplocalleader=" "

" File finding
nnoremap <leader>ff :find
nnoremap <leader>fs :sfind 
nnoremap <leader>fv :vert :sfind 
nnoremap <leader>ft :tabfind 

" Split lines
nnoremap S a<cr><esc>
nnoremap <leader>O O<esc>
nnoremap <leader>o o<esc>

" Buffer management
nnoremap ]b :bn<cr>
nnoremap [b :bp<cr>
nnoremap <leader>b :ls<cr>:b
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
vnoremap <leader>" <esc>`<i"<esc>`>la"<esc>
vnoremap <leader>' <esc>`<i'<esc>`>la'<esc>
vnoremap <leader>( <esc>`<i(<esc>`>la)<esc>
vnoremap <leader>[ <esc>`<i[<esc>`>la]<esc>
vnoremap <leader>{ <esc>`<i{<esc>`>la}<esc>
vnoremap <leader>< <esc>`<i<<esc>`>la><esc>

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

command W w
command Gco :!fzf-git co

" Notes mappings
command! -bang NotesSel call fzf#vim#files("~/documents/notes", {"options": ["--query=index.md", "--preview", "cat {}"]}, <bang>0) 
command! -nargs=1 NewNote :execute ":e" "~/documents/notes/" . strftime("%Y%m%d%H%M%S") . "-<args>.md"
nnoremap <leader>ws :NotesSel<cr>
nnoremap <leader>ww :e ~/documents/notes/index.md<cr>
nnoremap <leader>wn :NewNote 
