local status, mason = pcall(require, "mason")
if not status then
    print("Mason setup")    -- TODO
    return
end

local status, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status then
    print("Mason lsp setup")    -- TODO
    return
end

mason.setup()

mason_lspconfig.setup({
    ensure_installed = {
        "rust_analyzer",
        "clangd",
        "lua_ls",
    }
})
