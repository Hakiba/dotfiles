-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- Turn off paste mode when leaving insert
vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = "*",
  command = "set nopaste",
})

--open vim with telescope find_files

vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    -- Vérifie si aucun fichier spécifique n'est passé en argument
    if vim.fn.argc() == 0 or vim.fn.isdirectory(vim.fn.argv(0)) == 1 then
      -- Lance Telescope file_browser uniquement si aucun fichier n'est donné ou si un dossier est donné
      vim.cmd("Telescope file_browser")
    end
  end,
})

-- Disable the concealing in some file formats
-- The default conceallevel is 3 in LazyVim
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "json", "jsonc", "markdown" },
  callback = function()
    vim.opt.conceallevel = 0
  end,
})

-- vim.cmd(":Copilot disable")
