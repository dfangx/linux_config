require'lsp/attach'
require'lsp/diagnostics'
vim.api.nvim_set_option("updatetime", 300)
vim.api.nvim_win_set_option(0, "signcolumn", "yes")

-- Use a loop to conveniently both setup defined servers 
-- and map buffer local keybindings when the language server attaches
local servers = { "pyright", "rust_analyzer", "clangd" }
local nvim_lsp = require'lspconfig'
for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup { on_attach = on_attach }
end
