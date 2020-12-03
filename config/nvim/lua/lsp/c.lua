require'lsp/common'

local nvim_lsp = require'lspconfig'
nvim_lsp.ccls.setup{
    init_options = {
        highlight = {
            lsRanges = true
        }
    }; 
    root_dir = nvim_lsp.util.root_pattern("compile_commands.json", "compile_flags.txt", ".ccls", ".git"); 
    on_attach = on_attach;
}
