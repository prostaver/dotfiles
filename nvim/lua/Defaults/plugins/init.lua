return {
    {
        "nvim-lua/plenary.nvim",
        name = "plenary"
    },
    {
        "catppuccin/nvim",
        name = "catppuccin",
        config = function()
            require("catppuccin").setup({
                flavour = "macchiato",
                transparent_background = true
            })
            vim.cmd("colorscheme catppuccin")
        end
    }
}
