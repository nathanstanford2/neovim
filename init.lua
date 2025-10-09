local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("vim-options")
require("lazy").setup("plugins")

vim.keymap.set('n', '<C-b>', '<Cmd>Neotree toggle<CR>')
vim.keymap.set("n", "<leader>h", ":bprevious<CR>")
vim.keymap.set("n", "<leader>l", ":bnext<CR>")

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
