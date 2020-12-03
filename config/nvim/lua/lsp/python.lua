require'lsp/common'
local nvim_lsp = require'lspconfig'

nvim_lsp.pyright.setup {
    on_attach = on_attach;
}
