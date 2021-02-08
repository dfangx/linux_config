let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
setlocal conceallevel=1
let g:tex_conceal='abdmg'
high Conceal guibg=none ctermbg=none

setlocal textwidth=80

if has('nvim')
    lua require'vimtex'
    let g:vimtex_format_enabled = 1
    let g:completion_chain_complete_list = {
                \ 'tex' : [
                \     {'complete_items': ['vimtex', 'snippet']}, 
                \     {'mode': '<c-p>'}, 
                \     {'mode': '<c-n>'}, 
                \   ],
                \ }
endif
