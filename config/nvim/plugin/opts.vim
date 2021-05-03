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
set guicursor=
set spellfile=$XDG_CONFIG_HOME/nvim/spell/en.utf8.add
set ignorecase
set smartcase

let g:tex_flavor='latex'
let g:netrw_browsex_viewer="xdg-open"
let g:notes_home = '~/notes'

