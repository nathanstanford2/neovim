vim.cmd("let g:netrw_liststyle = 3")

local opt = vim.opt

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

opt.relativenumber = true
opt.number = true

opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true

opt.termguicolors = true

opt.background = "dark"             -- colorschemes that can be light or dark will be made dark
opt.signcolumn = "yes"              -- show sign column so that text doesn't shift

opt.backspace = "indent,eol,start"  -- allow backspace on indent, end of line or insert mode start position

opt.clipboard:append("unnamedplus") -- use system clipboard as default register

opt.splitright = true               -- split vertical window to the right
opt.splitbelow = true               -- split horizontal window to the bottom

opt.swapfile = false


opt.list = true
opt.listchars = {
    eol = ' ',
    tab = '> ',
    trail = '.',
    nbsp = '.',
    space = '·',
}

vim.api.nvim_create_autocmd("FocusLost", {
    pattern = "*",
    callback = function()
        -- Only save if the buffer is modified and not in insert mode
        if vim.bo.modified and vim.api.nvim_get_mode().mode ~= "i" then
            vim.cmd("silent update")
        end
    end,
})

-- Autosave on InsertLeave (when you leave Insert mode)
vim.api.nvim_create_autocmd("InsertLeave", {
    pattern = "*",
    callback = function()
        if vim.bo.modified and vim.bo.filetype ~= "" and vim.bo.buftype == "" then
            vim.cmd("silent! write")
        end
    end,
})

-- Autosave on FocusLost (when the Neovim window loses focus)
vim.api.nvim_create_autocmd("FocusLost", {
    pattern = "*",
    callback = function()
        if vim.bo.modified and vim.bo.filetype ~= "" and vim.bo.buftype == "" then
            vim.cmd("silent! write")
        end
    end,
})
