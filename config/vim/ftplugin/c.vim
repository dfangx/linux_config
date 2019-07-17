iabclear
inoreabbrev <buffer> inc #include <><esc>i<c-r>=Eatchar('\s')<cr>
inoreabbrev <buffer> incg #ifndef <c-r>=placeholder<cr>_H<cr>#define <c-r>=placeholder<cr>_H<cr><c-r>=placeholder<cr><cr>#endif<esc>:call search(placeholder)<cr>cf><c-o>:call matchadd('Search',placeholder)<cr><c-r>=Eatchar('\s')<cr>
inoreabbrev <buffer> if if (){<cr>}<esc>:call search(')', 'b')<cr>i<c-r>=Eatchar('\s')<cr>
inoreabbrev <buffer> eli else if (){<cr>}<esc>:call search(')', 'b')<cr>i<C-r>=Eatchar('\s')<cr>
inoreabbrev <buffer> el else {<cr>}<esc>O<c-r>=Eatchar('\s')<cr>
inoreabbrev <buffer> main int main(int argc, char** argv)<cr>{<cr>return 0;<cr>}<esc>kO<c-r>=Eatchar('\s')<cr>
inoreabbrev <buffer> whlp while (){<cr>}<esc>k%i<c-r>=Eatchar('\s')<cr>
inoreabbrev <buffer> fori for(int i = 0; i < <c-r>=placeholder<cr>; i++){<cr>}<esc>:call search(placeholder)<cr>cf><c-o>:call matchadd('Search',placeholder)<cr><c-r>=Eatchar('\s')<cr>
inoreabbrev <buffer> for for(<c-r>=placeholder<cr>; <c-r>=placeholder<cr>; <c-r>=placeholder<cr>){<cr>}<esc>:call search(placeholder)<cr>cf><c-o>:call matchadd('Search',placeholder)<cr><c-r>=Eatchar('\s')<cr>
inoreabbrev <buffer> func <c-r>=placeholder<cr> <c-r>=placeholder<cr>(<c-r>=placeholder<cr>)<cr>{<cr><c-r>=placeholder<cr><cr>}<esc>:call search(placeholder)<cr>cf><c-o>:call matchadd('Search',placeholder)<cr><c-r>=Eatchar('\s')<cr>
