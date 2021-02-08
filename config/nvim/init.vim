source $HOME/.config/nvim/config/settings.vim
source $HOME/.config/nvim/config/mappings.vim
source $HOME/.config/nvim/config/plugins.vim"
source $HOME/.config/nvim/config/colors.vim
source $HOME/.config/nvim/config/status.vim

if has('nvim')
    lua require'lsp/setup'
endif
