require'nvim-treesitter.configs'.setup {
    ensure_installed = "cpp", 
    highlight = {
        enable = true
    }
}

vim.api.nvim_set_option("foldmethod", "expr")
vim.api.nvim_set_option("foldexpr", "nvim_treesitter#foldexpr()")
