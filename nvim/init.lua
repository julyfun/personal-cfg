local vimrc = vim.fn.stdpath("config") .. "/init2.vim"
vim.cmd.source(vimrc)

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
-- 
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    -- add your plugins here
    -- [cursor]
    {
      "folke/flash.nvim",
      event = "VeryLazy",
      ---@type Flash.Config
      opts = {
        modes = {
          search = { enabled = true }
        }
      },
      -- stylua: ignore
      keys = {
        { "s", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
        { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
      },
    },
    -- [lsp]
    {
      "nvim-treesitter/nvim-treesitter",
      build = ":TSUpdate",
      config = function () 
        local configs = require("nvim-treesitter.configs")

        configs.setup({
            ensure_installed = {
              "c", "lua", "vim",
              "vimdoc", "query", "elixir",
              "heex", "javascript", "html",
              "python", "rust", "markdown",
              "markdown_inline", "typst"
            },
            sync_install = false,
            highlight = { enable = true },
          })
      end
    },
    -- [markdown]
    {
      'MeanderingProgrammer/render-markdown.nvim',
      dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
      opts = {},
    },
    {
      "folke/tokyonight.nvim",
      lazy = false,
      priority = 1000,
      opts = {},
    },
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/cmp-buffer' },
    { 'hrsh7th/cmp-path' },
    { 'hrsh7th/cmp-cmdline' },
    { 'hrsh7th/nvim-cmp' },
    -- [vscode.quick-open]
    {
      'nvim-telescope/telescope.nvim', tag = '0.1.8',
      dependencies = { 'nvim-lua/plenary.nvim' }
    },
    { 'kkharji/sqlite.lua' },
    -- [diagnostic]
    { import = "plugins.trouble" },
    { import = "plugins.lsp" },
    { import = "plugins.rustaceanvim" },
    -- [stacks (utility bundle)]
    { import = "plugins.snacks" },
    -- [copilot]
    { 'github/copilot.vim' },
    { import = "plugins.CopilotChat" },
    -- [end]
  },
  -- automatically check for plugin updates
  checker = { enabled = true },
})

-- [markdown]
require('render-markdown').setup({
    completions = { lsp = { enabled = true } },
})
require('plugins.nvim-cmp')

-- [fish]
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'fish',
  callback = function()
    vim.lsp.start({
      name = 'fish-lsp',
      cmd = { 'fish-lsp', 'start' },
      cmd_env = { fish_lsp_show_client_popups = false },
    })
  end,
})

-- [lsp]
vim.diagnostic.config({ virtual_text = true })

-- [color]
vim.cmd[[colorscheme tokyonight]]

