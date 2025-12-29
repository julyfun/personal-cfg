return {
    {
        "neovim/nvim-lspconfig",
        lazy = false,
        config = function()
            -- For Neovim 0.11+, use vim.lsp.config
            vim.lsp.config('sourcekit', {})
        end,
    }
}
