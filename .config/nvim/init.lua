-- =============================================================================
-- Neovim entry point (Lua + lazy.nvim)
--
-- A lean, vim-like config that reproduces the look & behavior of the old
-- ~/.vimrc setup (molokai, leader=Space, NERDTree/CtrlP-style keys, ...) while
-- moving to the common Lua/lazy.nvim stack (treesitter, telescope, ...).
--
-- Note: while this init.lua exists, Neovim uses it and ignores init.vim.
-- To fall back to the old Vim-bridge, just rename/remove this file.
-- =============================================================================

-- Leader must be set before lazy/plugins load.
vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("user.options")
require("user.keymaps")
require("user.autocmds")

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup(require("user.plugins"), {
  ui = { border = "rounded" },
  change_detection = { notify = false },
})
