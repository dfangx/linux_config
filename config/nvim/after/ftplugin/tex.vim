let s:loaded = get(s:, 'loaded', v:false)
if !s:loaded
    lua require'lsp/tex'
    let s:loaded = v:true
    doautocmd FileType tex
endif

setlocal textwidth=80

"iabclear
"inoreabbrev use \usepackage{}<esc>i
"inoreabbrev docclass \documentclass{}<esc>i
"inoreabbrev mkti \maketitle
"inoreabbrev ti \title{}<esc>i
"inoreabbrev be \begin{<c-r>=placeholder<cr>}<cr>\end{<c-r>=placeholder<cr>}<esc>:call search(placeholder)<cr>cf><c-o>:call matchadd('Search',placeholder)<cr><c-r>=Eatchar('\s')<cr>
"inoreabbrev auth \author{}<esc>i
"inoreabbrev sec \section{}<esc>i

