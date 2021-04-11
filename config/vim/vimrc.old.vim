""""""""""""""""""""""""""""""""""""""""""""""""""
" VIMRC FILE
""""""""""""""""""""""""""""""""""""""""""""""""""
"
""""""""""""""""""""""""""""""""""""""""""""""""""
" XDG_CONFIG
""""""""""""""""""""""""""""""""""""""""""""""""""
set undodir=$XDG_CACHE_HOME/vim/undo
set directory=$XDG_CACHE_HOME/vim/swap
set backupdir=$XDG_CACHE_HOME/vim/backup
set viminfo+=n$XDG_CACHE_HOME/vim/viminfo
set runtimepath=$XDG_CONFIG_HOME/vim,$VIMRUNTIME,$XDG_CONFIG_HOME/vim/after
set packpath+=$XDG_CONFIG_HOME/vim

let $MYVIMRC='$XDG_CONFIG_HOME/vim/vimrc'
""""""""""""""""""""""""""""""""""""""""""""""""""
" SETTINGS
""""""""""""""""""""""""""""""""""""""""""""""""""
set cursorline                              " Highlights line cursor is on
set lazyredraw                              " Redraw screen only when necessary
set showcmd                                 " Show command in bottom bar
set wildmenu                                " Turn on wildmenu
set wildmode=list:full,full
set wildignore+=*.bmp,*.gif,*.ico,*.png,*.pdf,*.psd
set showmatch                               " Highlight matching parenthesis
set backspace=indent,eol,start              " Backspace over everything in insert mode
set ruler                                   " Show cursor position all the time
set ttimeout                                " Time out for key codes
set ttimeoutlen=100                         " Wait up to 100ms after Esc for special key
set display=truncate                        " Show @@@ in last line if truncated
set scrolloff=5                             " Show a few lines of context around cursor
set showmode                                " Show mode in status bar
set autoindent                              " Autoindent
set pastetoggle=<F1>                        " Turn on paste mode when in insert mode
set hidden                                  " Hide files in background instead of closing them
set history=1000                            " Set undo limit to 1000
set writebackup                             " Protect against crash during write
set nobackup                                " Do not persist backup file after successful write
set undofile                                " Keep an undo file (undo changes after closing)
set incsearch                               " Do incremental searching when it's possible to timeout.
set hlsearch                                " Switch on highlighting the last used search pattern.
set foldenable                              " Enable code folding
set foldmethod=indent                       " Fold on indent
set foldlevelstart=0                        " Set starting fold level to 0
set number                                  " Display line numbers
set relativenumber                          " Display relative line numbers
set softtabstop=4
set shiftwidth=4
set expandtab                               " Convert tabs to spaces
set background=dark                         " Set background to dark
set splitbelow                              " New window splits on the bottom
set splitright                              " New window splits on the right side
set omnifunc=syntaxcomplete#Complete        " Enable omnicomplete
set autoread                                " Reread file when it is updated somewhere else
set encoding=utf-8
set scrolloff=1
set sidescrolloff=5
set laststatus=2
set smarttab
set tags+=.git/tags;/
set rtp+=~/src/fzf

filetype plugin indent on

let g:tex_flavor = "latex"
""""""""""""""""""""""""""""""""""""""""""""""""""""
" KEYBINDINGS
""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <Space> <NOP>
let mapleader=" "   " Set leader key
"let placeholder="<+++>"
"let searchph="call search(placeholder)"
"inoremap <c-j> <esc>:<c-r>=searchph<cr><cr>cf>
nnoremap <f2> :make<cr>
nnoremap <f3> i<c-r>=strftime("%Y%m%d%H%M%S")<cr><esc>
inoremap <f3> <c-r>=strftime("%Y%m%d%H%M%S")<cr>
nnoremap <f4> i<c-r>=strftime("%A %B %d %Y %H:%M:%S %Z")<cr><esc>
inoremap <f4> <c-r>=strftime("%A %B %d %Y %H:%M:%S %Z")<cr>

"nnoremap <c-s> :w<cr>
"inoremap <c-s> <c-o>:w<cr><esc>

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
nnoremap <expr>cs({ BracketToCurly(matchstr(getline('.'), '\%' . col('.') . 'c.'))
nnoremap <expr>cs{( CurlyToBracket(matchstr(getline('.'), '\%' . col('.') . 'c.'))

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

vnoremap <leader>( <esc>`>a)<esc>`<i(<esc>


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

" Edit vimrc
nnoremap <leader>ev :tabnew $MYVIMRC<cr>
nnoremap <leader>rv :source $MYVIMRC<cr>

" Open terminal
nnoremap <leader>t :Tags<cr>
"nnoremap <leader>T :vert term<cr>

cabbr Q q
cabbr Q! q!
cabbr W w

""""""""""""""""""""""""""""""""""""""""""""""""""""
" AUTOCOMMANDS
""""""""""""""""""""""""""""""""""""""""""""""""""""
" Put these in an autocmd group, so that you can revert them with:
" ":augroup vimStartup | au! | augroup END"
"
augroup vimStartup
    au!
    " When editing a file, always jump to the last known cursor position.
    " Don't do it when the position is invalid, when inside an event handler
    " (happens when dropping a file on gvim) and for a commit message (it's
    " likely a different one than last time).
    autocmd BufReadPost *
      \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
      \ |   exe "normal! g`\""
      \ | endif
augroup END

"augroup AutoMake
"    autocmd!
"    if filereadable("Makefile")
"        autocmd BufWritePost *.h,*.c,*.cpp make
"        autocmd QuickFixCmdPost * cwindow
"    endif
"augroup END


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

" UltiSnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsEditSplit="vertical"

" wiki.vim
"let g:wiki_root = "~/documents/notes"
"let g:wiki_filetypes = ["md", "wiki"]
"let g:wiki_link_target_type = "md"
"let g:wiki_map_link_create = "CreateZetNote"

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
"let g:fzf_preview_window = 'right:60%'
"
"function! GetCurrentLink()
"  let l:link_url_regex = '\[[^]]*\](\zs[^)]\+\ze)'
"  let l:line = getline('.')
"  let l:link = matchstr(line,
"        \ '\%<'.(col('.')+1).'c'.
"        \ link_url_regex.
"        \ '\%>'.col('.').'c')
"  return l:link
"endfun
"
"function! CreateFollowNote()
"    let l:link = GetCurrentLink()
"    if l:link != ""
"        let l:cur_path = expand("%:p:h")
"        let l:full_path =  l:cur_path . "/" . l:link
"        call add(g:note_stack, expand("%:p"))
"        exe "edit" l:full_path
"    endif
"endfunction
"
"function! GoBackNote()
"    if stridx(expand("%:p"), "/documents/notes") == -1
"        return
"    endif
"    
"    if g:note_stack == []
"        echo "In Wiki root already"
"        return
"    endif
"
"    let l:note_len = len(g:note_stack)
"    let l:back_link = g:note_stack[l:note_len - 1]
"    call remove(g:note_stack, l:note_len - 1)
"    execute "write"
"    execute "bdelete"
"    execute "edit" l:back_link
"endfunction
"
"nnoremap <silent> <cr> :call CreateFollowNote()<cr>
"nnoremap <silent> <bs> :call GoBackNote()<cr>

runtime! macros/matchit.vim
""""""""""""""""""""""""""""""""""""""""""""""""""""
" COLORS
""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax enable                               " Enable syntax highlighting
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif
let g:nord_bold = 1
let g:nord_italic = 1
let g:nord_italic_comments = 1
let g:nord_underline = 1
let g:nord_uniform_diff_background = 1
let g:nord_cursor_line_number_background = 1

colorscheme nord
"highlight Normal ctermbg=none guibg=NONE
"highlight NonText ctermbg=none guibg=NONE
"highlight CursorLine ctermbg=240 
"highlight CursorLineNr  ctermbg=240 
"highlight LineNr ctermbg=none guibg=NONE
"highlight StatusLine cterm=reverse,bold ctermfg=249 ctermbg=235
"highlight StatusLineNC cterm=reverse,bold ctermfg=243 ctermbg=234
"highlight User1 cterm=bold ctermfg=249 ctermbg=237
"highlight User2 cterm=bold ctermfg=249 ctermbg=240

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
