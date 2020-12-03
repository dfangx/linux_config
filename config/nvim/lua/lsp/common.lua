vim.api.nvim_buf_set_option(0, "omnifunc", "v:lua.vim.lsp.omnifunc")
vim.api.nvim_set_option("updatetime", 300)
vim.api.nvim_win_set_option(0, "signcolumn", "yes")
vim.api.nvim_buf_set_keymap(0, 'n', 'gd', "<cmd>lua vim.lsp.buf.declaration()<cr>", {
    noremap = true,
    silent = true
})
vim.api.nvim_buf_set_keymap(0, 'n', 'gD', "<cmd>lua vim.lsp.buf.implementation()<cr>", {
    noremap = true,
    silent = true
})
vim.api.nvim_buf_set_keymap(0, 'n', '<c-]>', "<cmd>lua vim.lsp.buf.definition()<cr>", {
    noremap = true,
    silent = true
})
vim.api.nvim_buf_set_keymap(0, 'n', 'silent> <K>', "<cmd>lua vim.lsp.buf.buffer()<cr>", {
    noremap = true,
    silent = true
})
vim.api.nvim_buf_set_keymap(0, 'n', '<c-k>', "<cmd>lua vim.lsp.buf.signature_help()<cr>", {
    noremap = true,
    silent = true
})
vim.api.nvim_buf_set_keymap(0, 'n', '<c-t>', "<cmd>lua vim.lsp.buf.type_definition()<cr>", {
    noremap = true,
    silent = true
})
vim.api.nvim_buf_set_keymap(0, 'n', 'gr', "<cmd>lua vim.lsp.buf.references()<cr>", {
    noremap = true,
    silent = true
})
vim.api.nvim_buf_set_keymap(0, 'n', 'g0', "<cmd>lua vim.lsp.buf.document_symbol()<cr>", {
    noremap = true,
    silent = true
})
vim.api.nvim_buf_set_keymap(0, 'n', 'gW', "<cmd>lua vim.lsp.buf.workspace_symbol()<cr>", {
    noremap = true,
    silent = true
})
vim.api.nvim_buf_set_keymap(0, 'n', '<leader>rn', "<cmd>lua vim.lsp.buf.rename()<cr>", {
    noremap = true,
    silent = true
})
vim.api.nvim_buf_set_keymap(0, 'n', '<leader>qf', "<cmd>lua vim.lsp.buf.code_action()<cr>", {
    noremap = true,
    silent = true
})

on_attach = function(client)
    require'completion'.on_attach(client)
end

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    -- This will disable virtual text, like doing:
    -- let g:diagnostic_enable_virtual_text = 0
    virtual_text = true,

    -- This is similar to:
    -- let g:diagnostic_show_sign = 1
    -- To configure sign display,
    --  see: ":help vim.lsp.diagnostic.set_signs()"
    signs = true,

    -- This is similar to:
    -- "let g:diagnostic_insert_delay = 1"
    update_in_insert = true,
  }
)
