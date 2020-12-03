""""""""""""""""""""""""""""""""""""""""""""""""""
" SETTINGS
""""""""""""""""""""""""""""""""""""""""""""""""""
set completeopt=menuone,noinsert,noselect
set cursorline                              " Highlights line cursor is on
set lazyredraw                              " Redraw screen only when necessary
set showcmd                                 " Show command in bottom bar
set wildmenu                                " Turn on wildmenu
set wildmode=list:full,full
set wildignore+=*.bmp,*.gif,*.ico,*.png,*.pdf,*.psd
set showmatch                               " Highlight matching parenthesis
set scrolloff=5                             " Show a few lines of context around cursor
set showmode                                " Show mode in status bar
set pastetoggle=<F1>                        " Turn on paste mode when in insert mode
set hidden                                  " Hide files in background instead of closing them
set history=1000                            " Set undo limit to 1000
set writebackup                             " Protect against crash during write
set nobackup                                " Do not persist backup file after successful write
set undofile                                " Keep an undo file (undo changes after closing)
set foldenable                              " Enable code folding
set foldmethod=indent                       " Fold on indent
set foldlevelstart=0                        " Set starting fold level to 0
set number                                  " Display line numbers
set relativenumber                          " Display relative line numbers
set softtabstop=4
set shiftwidth=4
set expandtab                               " Convert tabs to spaces
set splitbelow                              " New window splits on the bottom
set splitright                              " New window splits on the right side
set omnifunc=syntaxcomplete#Complete        " Enable omnicomplete
set autoread                                " Reread file when it is updated somewhere else
set scrolloff=1
set sidescrolloff=5
set tags+=.git/tags;/
set rtp+=~/src/fzf
set guicursor=
set shortmess+=c

let g:tex_flavor="latex"

""""""""""""""""""""""""""""""""""""""""""""""""""
" KEYBINDS
""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <Space> <NOP>
let mapleader=" "   " Set leader key

" File finding
nnoremap <leader>ff :Files<cr>
nnoremap <leader>fs :sfind 
nnoremap <leader>fv :vert :sfind 
nnoremap <leader>ft :tabfind 

" Split lines
nnoremap S a<cr><esc>
nnoremap <leader>O O<esc>
nnoremap <leader>o o<esc>

" Buffers
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

""""""""""""""""""""""""""""""""""""""""""""""""""""
" FUNCTIONS
""""""""""""""""""""""""""""""""""""""""""""""""""""
function! Eatchar(pat)
    let c = nr2char(getchar(0))
    return (c =~ a:pat) ? '' : c
endfunction

function! GitIsRepo()
    let l:isRepo = system("git rev-parse --is-inside-work-tree | tr -d '\n'")
    if l:isRepo == 'true'
        return 1
    else
        return 0
    endif
endfunction

function! GitBranch()
    let l:branch = system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
    if strlen(l:branch) > 0
        return ' ' . l:branch
    else
        return ''
    endif
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

function! IsReadOnly()
    if &readonly
        return ''
    else
        return ''
    endif
endfunction

function! GetMode()
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

""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGINS
"""""""""""""""""""""""""""""""""""""""""""""""""""
packadd! nord-vim

if exists('$TMUX')
    packadd! vim-tmux-navigator
else
    nnoremap <c-j> <c-w>j
    nnoremap <c-k> <c-w>k
    nnoremap <c-l> <c-w>l
    nnoremap <c-h> <c-w>h
endif
let g:fzf_layout = { 'down': '~40%' }
" UltiSnips
"let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsExpandTrigger="<c-s>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsEditSplit="vertical"

function! CreateZetNote(name) abort
    return strftime("%Y%m%d%H%M%S") . "-" . name ".md"
endfunction

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

let g:netrw_browsex_viewer="xdg-open"

let g:completion_enable_snippet = 'UltiSnips'
" let g:completion_enable_auto_paren = 1
inoremap <expr> <tab> pumvisible() ? "\<C-n>" : "\<tab>"
inoremap <expr> <s-tab> pumvisible() ? "\<C-p>" : "\<s-tab>"

""""""""""""""""""""""""""""""""""""""""""""""""""""
" COLORS
""""""""""""""""""""""""""""""""""""""""""""""""""""
if exists('+termguicolors')
  set termguicolors
endif
let g:nord_italic = 1
let g:nord_italic_comments = 1
let g:nord_underline = 1
let g:nord_uniform_diff_background = 1
let g:nord_cursor_line_number_background = 1

colorscheme nord

""""""""""""""""""""""""""""""""""""""""""""""""""""
" STATUS LINE
""""""""""""""""""""""""""""""""""""""""""""""""""""
set statusline=
set statusline+=%*
set statusline+=\ %{GetMode()}
set statusline+=\ 
set statusline+=%2*
"set statusline+=

if GitIsRepo()
    set statusline+=\ %{GitBranch()}
    "    set statusline+=\[
    "    set statusline+=M%{GitNumModified()}
    "    set statusline+=:
    "    set statusline+=S%{GitNumStaged()}
    "    set statusline+=\]
    set statusline+=\  
    set statusline+=%1*
    "    set statusline+=
    "set statusline+=\ 
endif

set statusline+=\ %n:
set statusline+=\ %f
set statusline+=\ %M
set statusline+=\ %{IsReadOnly()}
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

