local configs = require("nvim-treesitter.configs")

configs.setup({
    ensure_installed = { "c", "lua", "vim", "vimdoc", "cpp", "rust", "go", "javascript", "html" },
    sync_install = false,
    auto_install = true,
    highlight = { enable = true },
    indent = { enable = true },
})

vim.filetype.add({
    extension = {
        templ = 'templ',
    },
})
