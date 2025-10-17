vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.g.mapleader = " "
vim.g.background = "light"

vim.opt.swapfile = false

local keymap = vim.keymap

local opts = { noremap = true, silent = true }

-- Navigate vim panes better
keymap.set('n', '<c-k>', ':wincmd k<CR>')
keymap.set('n', '<c-j>', ':wincmd j<CR>')
keymap.set('n', '<c-h>', ':wincmd h<CR>')
keymap.set('n', '<c-l>', ':wincmd l<CR>')

keymap.set("n", "dw", 'vb"_d')
keymap.set('n', 'te', ':tabedit')

keymap.set("n", "ss", ":split<Return>", opts)
keymap.set("n", "sv", ":vsplit<Return>", opts)

keymap.set("n", "<C-a>", "gg<S-v>G")

keymap.set({ "n", "i" }, "<C-s>", "<cmd>update<cr>", { desc = "Save file" })

keymap.set('n', '<leader>h', ':nohlsearch<CR>')

keymap.set("n", "<M-l>", ":bnext<CR>", { desc = "Next buffer" })
keymap.set("n", "<M-h>", ":bprevious<CR>", { desc = "Previous buffer" })

vim.api.nvim_set_keymap("i", "jj", "<Esc>", { noremap = false });

vim.wo.number = true
vim.wo.relativenumber = true

vim.opt.list = true
vim.opt.listchars = {
    eol = ' ',
    tab = '> ',
    trail = '.',
    nbsp = '.',
    space = '·',
}
