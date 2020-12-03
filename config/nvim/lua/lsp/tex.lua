require'lsp/common'

local nvim_lsp = require'lspconfig'
nvim_lsp.texlab.setup {
    on_attach = on_attach
}
