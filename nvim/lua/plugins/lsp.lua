return {
    {
        "neovim/nvim-lspconfig",
        lazy = false,
        config = function()
            -- For Neovim 0.11+, use vim.lsp.config
            vim.lsp.config('sourcekit', {})
            vim.lsp.config('zls', {
                cmd = { vim.fn.expand('$HOME/app/zls') },
                filetypes = { 'zig', 'zon' },
                root_markers = { 'build.zig', 'build.zig.zon' },
                settings = {
                    zls = {
                        zig_exe_path = vim.fn.expand('$HOME/app/zig'),
                    }
                },
            vim.lsp.enable('zls')
            })
        end,
    }
}
