require'nvim-treesitter.configs'.setup {
    ensure_installed = {"c", "cpp", "rust", "python", "yaml", "bash", "lua"}, 
    highlight = {
        enable = true
    }
}

vim.api.nvim_set_option("foldmethod", "expr")
vim.api.nvim_set_option("foldexpr", "nvim_treesitter#foldexpr()")
