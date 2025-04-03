-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- Turn off paste mode when leaving insert
vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = "*",
  command = "set nopaste",
})

--open vim with telescope find_files

-- Disable the concealing in some file formats
-- The default conceallevel is 3 in LazyVim
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "json", "jsonc", "markdown" },
  callback = function()
    vim.opt.conceallevel = 0
  end,
})

vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    -- Vérifie si aucun fichier n'est spécifié (comme vim sans arguments) ou si on ouvre un répertoire (vim .)
    if vim.fn.argc() == 0 or vim.fn.isdirectory(vim.fn.argv(0)) == 1 then
      -- Vérifie si Telescope est chargé avant d'exécuter la commande
      local telescope_ok, telescope = pcall(require, "telescope")
      if telescope_ok then
        vim.cmd("Telescope file_browser")
      else
        print("Telescope not loaded correctly.")
      end
    end
  end,
})
-- vim.cmd(":Copilot disable")
