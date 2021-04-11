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

    if has('nvim')
        autocmd FileType rust,c,cpp,python,yaml,bash,sh,lua call SetupTreesitterNord()
    endif
endfunction

function SetupTreesitterNord()
    packadd! nvcode-color-schemes.vim
    colorscheme nord
endfunction

if has('termguicolors')
    set termguicolors
endif
call SetupNord()
