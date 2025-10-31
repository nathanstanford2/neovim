local map = vim.keymap.set


-- neovim window navigation
map('n', '<c-k>', ':wincmd k<CR>')
map('n', '<c-j>', ':wincmd j<CR>')
map('n', '<c-h>', ':wincmd h<CR>')
map('n', '<c-l>', ':wincmd l<CR>')


local opts = { noremap = true, silent = true }

opts.desc = "Clear highlighting groups"
map('n', '<leader>h', ':nohlsearch<CR>', opts)

opts.desc = "Next buffer"
map("n", "<M-l>", ":bnext<CR>", opts)

opts.desc = "Previous buffer"
map("n", "<M-h>", ":bprevious<CR>", opts)

opts.desc = "Horizontal split"
map("n", "<leader>hs", ":split<Return>", opts)

opts.desc = "Veritcal split"
map("n", "<leader>vs", ":vsplit<Return>", opts)

opts.desc = "Yank into system clipboard"
map({ "n", "x" }, "<leader>y", '"+yy', opts)

opts.desc = "Delete into system clipboard"
map({ "n", "x" }, "<leader>d", '"+dd', opts)

opts.desc = "Paste from system clipboard"
map("n", "<C-v>", '"+p', opts)

opts.desc = "Write current buffer"
map("n", "<leader>w", "<Cmd>update<CR>", opts)

opts.desc = "Quit current buffer"
map("n", "<leader>q", "<Cmd>:quit<CR>", opts)

opts.desc = "Increase Window Width"
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", opts)

opts.desc = "Decrease Window Width"
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", opts)

map("i", "jj", "<Esc>", { noremap = false });
