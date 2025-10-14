vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.g.mapleader = " "
vim.g.background = "light"

vim.opt.swapfile = false

-- Navigate vim panes better
vim.keymap.set('n', '<c-k>', ':wincmd k<CR>')
vim.keymap.set('n', '<c-j>', ':wincmd j<CR>')
vim.keymap.set('n', '<c-h>', ':wincmd h<CR>')
vim.keymap.set('n', '<c-l>', ':wincmd l<CR>')

vim.keymap.set({ "n", "i" }, "<C-s>", "<cmd>w<cr>", { desc = "Save file" })

vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')

vim.keymap.set("n", "<M-l>", ":bnext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<M-h>", ":bprevious<CR>", { desc = "Previous buffer" })

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
