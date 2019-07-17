iabclear
inoreabbrev <buffer> sop System.out.println();<esc>hi<c-r>=Eatchar('\s')<cr>
inoreabbrev <buffer> if if (){<cr>}<esc>?)<cr>i<c-r>=Eatchar('\s')<cr>
inoreabbrev <buffer> eli else if (){<cr>}<esc>:call search(')', 'b')<cr>i<C-r>=Eatchar('\s')<cr>
inoreabbrev <buffer> el else {<cr>}<esc>O<C-r>=Eatchar('\s')<cr>
inoreabbrev <buffer> main public static void main(String [] args)<cr>{<cr>return 0;<cr>}<esc>kO<c-r>=Eatchar('\s')<cr>
inoreabbrev <buffer> whlp while (){<cr>}<esc>k%i<C-r>=Eatchar('\s')<cr>
inoreabbrev <buffer> fori for(int i = 0; i < s; i++){<cr>}<esc>:call search('s', 'b')<cr>viwc<c-r>=Eatchar('\s')<cr>
