return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = {
                    "vimdoc", "javascript", "html", "python", "rust", "css",
                    "json", "yaml", "markdown", "markdown_inline", "lua",
                    "vim", "c"
                },

                highlight = {
                    enable = true
                },

                indent = { enable = true },
                additional_vim_regex_highlighting = false,
            })
        end
    },
}
