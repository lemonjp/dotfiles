-- Autocommands — translated from .vim/config.vim and old init.vim
local group = vim.api.nvim_create_augroup("user_autocmds", { clear = true })
local au = vim.api.nvim_create_autocmd

-- Java / PHP use 4-space indent (was: fileTypeIndent augroup)
au("FileType", {
  group = group,
  pattern = { "java", "php" },
  callback = function()
    vim.bo.tabstop = 4
    vim.bo.softtabstop = 4
    vim.bo.shiftwidth = 4
  end,
})

-- Strip trailing whitespace on save (was: BufWritePre * :%s/\s\+$//e)
au("BufWritePre", {
  group = group,
  pattern = "*",
  callback = function()
    local view = vim.fn.winsaveview()
    vim.cmd([[silent! keeppatterns %s/\s\+$//e]])
    vim.fn.winrestview(view)
  end,
})

-- Markdown tweaks (from old init.vim): no spell, soft wrapping
au("FileType", {
  group = group,
  pattern = "markdown",
  callback = function()
    vim.opt_local.spell = false
    vim.opt_local.wrap = true
    vim.opt_local.linebreak = true
    vim.opt_local.breakindent = true
  end,
})
