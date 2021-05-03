if !has('nvim')
    source $HOME/.config/vim/vim.vim
endif

" Leader keys
nnoremap <Space> <NOP>
let mapleader=" "
let maplocalleader=" "

if exists('$TMUX')
    packadd! vim-tmux-navigator
endif

if has('nvim')
    call plugins#SetupCompe()
    call plugins#SetupNvimLsp()
    call plugins#SetupTreesitter()
else
    call plugins#SetupVimLsp()
    call plugins#SetupAsyncComplete()
    call plugins#SetupVSnipInteg()
end

call plugins#SetupFzf()
call plugins#SetupVSnip()
call plugins#SetupVimMarkdown()

packadd! goyo.vim
packadd! vim-pencil
let g:pencil#wrapModeDefault = 'soft'
" let g:pandoc#syntax#conceal#urls=1
" let g:pandoc#hypertext#editable_alternates_extensions = '\(pdf\|htm\|odt\|doc\|md\)'
let g:mkdx#settings     = { 'highlight': { 'enable': 1 },
                        \ 'enter': { 'enable': 0 },
                        \ 'links': { 'external': { 'enable': 1 } },
                        \ 'toc': { 'text': 'Table of Contents', 'update_on_write': 1 },
                        \ 'fold': { 'enable': 1 } }
