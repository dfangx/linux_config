call matchadd('Search', placeholder)
iabclear
inoreabbrev inc #include <><esc>i<c-r>=Eatchar('\s')<cr>
inoreabbrev incg #ifndef <c-r>=placeholder<cr>_H<cr>#define <c-r>=placeholder<cr>_H<cr><c-r>=placeholder<cr><cr>#endif<esc>:<c-r>=searchph<cr><cr>cf><c-r>=Eatchar('\s')<cr>
inoreabbrev if if (){<cr>}<esc>:call search(')', 'b')<cr>i<c-r>=Eatchar('\s')<cr>
inoreabbrev eli else if (){<cr>}<esc>:call search(')', 'b')<cr>i<C-r>=Eatchar('\s')<cr>
inoreabbrev el else {<cr>}<esc>O<c-r>=Eatchar('\s')<cr>
inoreabbrev main int main(int argc, char** argv)<cr>{<cr>return 0;<cr>}<esc>kO<c-r>=Eatchar('\s')<cr>
inoreabbrev func <c-r>=placeholder<cr> <c-r>=placeholder<cr>(<c-r>=placeholder<cr>)<cr>{<cr><c-r>=placeholder<cr><cr>}<esc>:<c-r>=searchph<cr><cr>cf><c-r>=Eatchar('\s')<cr>
inoreabbrev whlp while (){<cr>}<esc>k%i<c-r>=Eatchar('\s')<cr>
inoreabbrev for for(<c-r>=placeholder<cr>; <c-r>=placeholder<cr>; <c-r>=placeholder<cr>){<cr>}<esc>:<c-r>=searchph<cr><cr>cf><c-r>=Eatchar('\s')<cr>
inoreabbrev fori for(int i = 0; i < <c-r>=placeholder<cr>; i++){<cr>}<esc>:<c-r>=searchph<cr><cr>cf><c-r>=Eatchar('\s')<cr>
