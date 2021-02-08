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
    colorscheme nord
endfunction

if exists('+termguicolors')
    set termguicolors
endif


call SetupNord()
