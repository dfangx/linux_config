"let g:vimtex_view_method='zathura'
"let g:vimtex_quickfix_mode=0
"set conceallevel=1
"let g:tex_conceal='abdmg'
"high Conceal guibg=none ctermbg=none
"
"let s:loaded = get(s:, 'loaded', v:false)
"if !s:loaded
"    " packadd! vimtex
"    "lua require'lsp/tex'
"    lua require'vimtex'
"    let g:completion_chain_complete_list = {
"               \ 'default' : [
"               \     {'complete_items': ['vimtex', 'snippet']}, 
"               \   ],
"               \ }
"    let s:loaded = v:true
"    doautocmd FileType tex
"endif

setlocal textwidth=80

" lua require'completion'.addCompletionSource('vimtex', require'vimtex'.complete_item)
lua require'vimtex'
let g:vimtex_format_enabled = 1
let g:completion_chain_complete_list = {
           \ 'tex' : [
           \     {'complete_items': ['vimtex', 'snippet']}, 
           \     {'mode': '<c-p>'}, 
           \     {'mode': '<c-n>'}, 
           \   ],
           \ }
" lua require'completion'.on_attach()

"iabclear
"inoreabbrev use \usepackage{}<esc>i
"inoreabbrev docclass \documentclass{}<esc>i
"inoreabbrev mkti \maketitle
"inoreabbrev ti \title{}<esc>i
"inoreabbrev be \begin{<c-r>=placeholder<cr>}<cr>\end{<c-r>=placeholder<cr>}<esc>:call search(placeholder)<cr>cf><c-o>:call matchadd('Search',placeholder)<cr><c-r>=Eatchar('\s')<cr>
"inoreabbrev auth \author{}<esc>i
"inoreabbrev sec \section{}<esc>i

