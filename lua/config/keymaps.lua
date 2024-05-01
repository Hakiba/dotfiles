-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- Leader
keymap.set("n", "x", '"_x')
keymap.set("n", "<Esc>", ":noh<CR>")

-- Increment/decrement
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G")

-- Save with root permission (not working for now)
-- vim.api.nvim_set_keymap("i", "jk", "<ESC>", { noremap = true, silent = true })
--vim.api.nvim_create_user_command('W', 'w !sudo tee > /dev/null %', {})

-- Undo tree
vim.api.nvim_set_keymap("n", "U", ":UndotreeToggle<CR>", { noremap = true, silent = true })

keymap.set("n", "<C-k>", "i<CR><ESC>")
keymap.set("n", "<C-j>", "J")

-- New tab
keymap.set("n", "te", ":tabedit", opts)
keymap.set("n", "tc", ":tabclose", opts)
keymap.set("n", "<tab>", ":tabnext<Return>", opts)
keymap.set("n", "<s-tab>", ":tabprev<Return>", opts)

-- Split window
-- keymap.set("n", "ss", function()
--   vim.cmd("split")
--   require("telescope").load_extension("file_browser")
--   require("telescope").extensions.file_browser.file_browser({ cwd = vim.fn.expand("%:p:h") })
-- end)
keymap.set("n", "ss", ":split<Return>", opts)

-- Split the window vertically and open telescope file browse_folders
-- keymap.set("n", "sv", function()
--   vim.cmd("vsplit")
--   require("telescope").load_extension("file_browser")
--   require("telescope").extensions.file_browser.file_browser({ cwd = vim.fn.expand("%:p:h") })
-- end)
--
keymap.set("n", "sv", ":vsplit<Return><C-w>w", opts)

-- Move window
keymap.set("n", "<Space>", "<C-w>w")
keymap.set("", "sh", "<C-w>h")
keymap.set("", "sk", "<C-w>k")
keymap.set("", "sj", "<C-w>j")
keymap.set("", "sl", "<C-w>l")

-- Resize window
keymap.set("n", "<C-w><left>", "<C-w><")
keymap.set("n", "<C-w><right>", "<C-w>>")
keymap.set("n", "<C-w><up>", "<C-w>+")
keymap.set("n", "<C-w><down>", "<C-w>-")

-- Diagnostics
keymap.set("n", "<C-j>", function()
  vim.diagnostic.goto_next()
end, opts)
