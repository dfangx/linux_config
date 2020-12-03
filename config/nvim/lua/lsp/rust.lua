require'lsp/common'

local nvim_lsp = require'lspconfig'
nvim_lsp.rust_analyzer.setup {
    on_attach=on_attach
}
