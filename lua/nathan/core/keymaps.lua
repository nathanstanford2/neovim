local keymap = vim.keymap

keymap.set('n', '<c-k>', ':wincmd k<CR>')
keymap.set('n', '<c-j>', ':wincmd j<CR>')
keymap.set('n', '<c-h>', ':wincmd h<CR>')
keymap.set('n', '<c-l>', ':wincmd l<CR>')

keymap.set({ "n", "i" }, "<C-s>", "<cmd>w<cr>", { desc = "Save file" })

keymap.set('n', '<leader>h', ':nohlsearch<CR>')

keymap.set("n", "<M-l>", ":bnext<CR>", { desc = "Next buffer" })
keymap.set("n", "<M-h>", ":bprevious<CR>", { desc = "Previous buffer" })

keymap.set("n", "ss", ":split<Return>")
keymap.set("n", "sv", ":vsplit<Return>")

keymap.set("i", "jj", "<Esc>", { noremap = false });

