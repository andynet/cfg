local status, lspconfig = pcall(require, "lspconfig")
if not status then
    print("lspconfig not loaded")
    return
end

local status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status then
    print("cmp_nvim_lsp not leaded")
    return
end

local on_attach = function(client, bufnr) end
local capabilities = cmp_nvim_lsp.default_capabilities()

lspconfig["lua_ls"].setup({
    capabilities = capabilities,
    on_attach = on_attach,
})

lspconfig["rust_analyzer"].setup({
    capabilities = capabilities,
    on_attach = on_attach,
})
