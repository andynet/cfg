local status, cmp = pcall(require, "cmp")
if not status then
    return
end

-- vim.opt.completeopt = "menu,menuone,noselect"

cmp.setup({
    mapping = cmp.mapping.preset.insert({
        ["<S-Tab>"]     = cmp.mapping.select_prev_item(),
        ["<Tab>"]       = cmp.mapping.select_next_item(),
        ["<C-Space>"]   = cmp.mapping.complete(),
        ["<C-e>"]       = cmp.mapping.abort(),
        ["<CR>"]        = cmp.mapping.confirm({ select = false }),
        ["<Up>"]       = cmp.mapping.scroll_docs(-4),  -- TODO
        ["<Down>"]       = cmp.mapping.scroll_docs(4),   -- TODO
    }),
    sources = cmp.config.sources({
        { name = "nvim_lsp" },  -- lsp
        { name = "buffer" },    -- text within current buffer
        { name = "path" },      -- file system paths
    }),
})
