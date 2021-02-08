local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
local opts = { noremap=true, silent=true, expr=true }
buf_set_keymap('i', '<cr>', "compe#confirm('<cr>')", opts)
buf_set_keymap('i', '<c-space>', "compe#complete()", opts)
require'compe'.setup ({
    enabled = true;
    autocomplete = true;
    debug = false;
    min_length = 1;
    preselect = 'enable';
    throttle_time = 80;
    source_timeout = 200;
    incomplete_delay = 400;
    allow_prefix_unmatch = false;

    source = {
        path = true;
        buffer = true;
        calc = true;
        vsnip = true;
        nvim_lsp = true;
        nvim_lua = true;
        spell = true;
        tags = true;
    };
}, 0)
