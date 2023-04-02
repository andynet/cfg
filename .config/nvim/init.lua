vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1
-- vim.opt.completeopt = "menu,menuone,noselect"

require("plugins-setup")

-- options
vim.cmd [[colorscheme gruvbox]]

vim.opt.relativenumber = true
vim.opt.number = true

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autoindent = true

vim.opt.wrap = false
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.termguicolors = true
vim.opt.backspace = "indent,eol,start"

vim.opt.clipboard:append("unnamedplus")
vim.opt.completeopt = "menu,menuone"

vim.diagnostic.config({ virtual_text = false })

vim.o.listchars = "tab:> ,trail:."
vim.o.list = true   -- turn off with :set nolist

vim.o.colorcolumn = "80"

-- keymaps
vim.g.mapleader = " "

vim.keymap.set("i", "jk", "<ESC>")
vim.keymap.set("n", "<leader>nh", ":nohl<CR>")
vim.keymap.set("n", "x", '"_x')

vim.keymap.set("n", "<leader>sv", "<C-w>v")
vim.keymap.set("n", "<leader>sh", "<C-w>s")
vim.keymap.set("n", "<leader>se", "<C-w>=")
vim.keymap.set("n", "<leader>sx", ":close<CR>")

vim.keymap.set("n", "<leader>to", ":tabnew<CR>")
vim.keymap.set("n", "<leader>tx", ":tabclose<CR>")
vim.keymap.set("n", "<leader>tn", ":tabn<CR>")
vim.keymap.set("n", "<leader>tp", ":tabp<CR>")
vim.keymap.set("t", "<ESC>", "<C-\\><C-n>")

vim.keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>")

vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")

vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float)

