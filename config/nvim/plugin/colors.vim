""""""""""""""""""""""""""""""""""""""""""""""""""""
" COLORS
""""""""""""""""""""""""""""""""""""""""""""""""""""
function SetupNord()
    packadd! nord-vim
    let g:nord_italic = 1
    let g:nord_italic_comments = 1
    let g:nord_underline = 1
    let g:nord_uniform_diff_background = 1
    let g:nord_cursor_line_number_background = 1
    " Enable for vim-pandoc-syntax
    " au Colorscheme * hi! link Conceal Number
    colorscheme nord

endfunction

function SetupTreesitterNord()
    packadd! nvcode-color-schemes.vim
    colorscheme nord
endfunction

if has('termguicolors')
    set termguicolors
endif
call SetupNord()
