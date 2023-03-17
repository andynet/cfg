local ensure_packer = function()
    local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
    if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
        vim.fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
        vim.cmd([[packadd packer.nvim]])
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

vim.cmd([[ 
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
    augroup end
]])

local safe_load = function(plugin_name)
    local loaded, plugin = pcall(require, plugin_name)
    if not loaded then
        print("Cannot load plugin ", plugin_name)
    end
    return plugin
end

local packer = safe_load("packer")
packer.startup(
    function(use)
        use("wbthomason/packer.nvim")
        use("morhetz/gruvbox")

        use("christoomey/vim-tmux-navigator")
        use("szw/vim-maximizer")

        use("nvim-tree/nvim-tree.lua")

        use("hrsh7th/nvim-cmp")
        use("hrsh7th/cmp-buffer")
        use("hrsh7th/cmp-path")
        use("hrsh7th/cmp-nvim-lsp")
        use("saadparwaiz1/cmp_luasnip")

        use("L3MON4D3/LuaSnip")

        use("williamboman/mason.nvim")
        use("williamboman/mason-lspconfig.nvim")
        use("neovim/nvim-lspconfig")

        use("nvim-treesitter/nvim-treesitter")

        use("lewis6991/gitsigns.nvim")

        use("folke/neodev.nvim")

        if packer_bootstrap then
            packer.sync()
        end
    end
)

-- require("plugins.nvim-tree")
local nvimtree = safe_load("nvim-tree")
nvimtree.setup()

-- require("plugins.nvim-cmp")
local cmp = safe_load("cmp")
local luasnip = safe_load("luasnip")

cmp.setup({
    snippet = {
        expand = function(args) luasnip.lsp_expand(args.body) end
    },
    mapping = cmp.mapping.preset.insert({
        ["<S-Tab>"]     = cmp.mapping.select_prev_item(),
        ["<Tab>"]       = cmp.mapping.select_next_item(),
        ["<C-Space>"]   = cmp.mapping.complete(),
        ["<C-e>"]       = cmp.mapping.abort(),
        ["<CR>"]        = cmp.mapping.confirm({ select = false }),
        ["<Up>"]        = cmp.mapping.scroll_docs(-4),  -- TODO
        ["<Down>"]      = cmp.mapping.scroll_docs(4),   -- TODO
    }),
    sources = cmp.config.sources({
        { name = "nvim_lsp" },  -- lsp
        -- { name = "luasnip" },   -- ???
        { name = "buffer" },    -- text within current buffer
        { name = "path" },      -- file system paths
    }),
})

-- require("plugins.mason")
local mason = safe_load("mason")
local mason_lspconfig = safe_load("mason-lspconfig")

mason.setup()
mason_lspconfig.setup({
    ensure_installed = {
        "rust_analyzer",
        "clangd",
        "lua_ls",
    }
})
-- require("plugins.lspconfig")
local lspconfig = safe_load("lspconfig")
local cmp_nvim_lsp = safe_load("cmp_nvim_lsp")

-- local on_attach = function(client, bufnr) end
local capabilities = cmp_nvim_lsp.default_capabilities()

lspconfig["lua_ls"].setup({
    capabilities = capabilities,
    -- on_attach = on_attach,
})

lspconfig["rust_analyzer"].setup({
    capabilities = capabilities,
    -- on_attach = on_attach,
})

-- require("plugins.gitsigns")
local gitsigns = safe_load("gitsigns")
gitsigns.setup()

-- require("plugins.nvim-treesitter")
local nvimtreesitter = safe_load("nvim-treesitter")

nvimtreesitter.setup({
  ensure_installed = { "rust", "c", "lua", "vim", "help", "query" },
  sync_install = false,
  auto_install = true,

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
})

local neodev = safe_load("neodev")
neodev.setup()

